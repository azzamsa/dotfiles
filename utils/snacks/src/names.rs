use clap::{Parser, ValueEnum};

use crate::utils;

static ADJECTIVES: &[&str] = &[
    "ambitious",
    "brave",
    "bright",
    "calm",
    "charismatic",
    "compassionate",
    "confident",
    "courageous",
    "creative",
    "determined",
    "dynamic",
    "empathetic",
    "energetic",
    "enthusiastic",
    "fearless",
    "grateful",
    "harmonious",
    "humble",
    "imaginative",
    "inspiring",
    "joyful",
    "kind",
    "knowledgeable",
    "loving",
    "mindful",
    "motivated",
    "optimistic",
    "passionate",
    "persevering",
    "positive",
    "proactive",
    "radiant",
    "resilient",
    "serene",
    "strong",
    "tenacious",
    "trustworthy",
    "unstoppable",
    "vibrant",
    "wise",
    "adaptable",
    "balanced",
    "bold",
    "caring",
    "confident",
    "courageous",
    "creative",
    "empowered",
    "focused",
    "generous",
    "gracious",
    "honest",
    "humorous",
    "innovative",
    "intuitive",
    "joyful",
    "loyal",
    "patient",
    "resilient",
];

static ISLAMIC: &[&str] = &[
    "bajja", // A scientist known for his contributions to various fields, including physics, philosophy, and medicine.
    "astrulabi", // Made the astrolabe, an instrument used for astronomical measurements and navigation.
    "banumusa", // Developed a programmable machine called the "automatic flute player," which could play different tunes using a system of rotating cylinders.
    "battani", // A mathematician and astronomer known for his accurate measurements of celestial movements and his important contributions to trigonometry.
    "battuta", // A renowned traveler and explorer who documented his extensive journeys, providing valuable insights into the societies and cultures of the medieval Islamic world.
    "biruni", // A scholar known for his work in physics, mathematics, and astronomy, as well as his extensive studies of various cultures and civilizations.
    "firnas", // Known as a performer of the first flight, Abbas Ibn Firnas attempted to fly using a contraption resembling wings, making significant contributions to early aviation experiments.
    "haitsam", // An astronomer who made significant advancements in the field, particularly in the study of optics and visual perception.
    "haytham", // A polymath known for his work in optics and visual perception.
    "idrisi", // Produced the first accurate map of the world known as the Tabula Rogeriana, showcasing his expertise in geography and cartography.
    "jazair", // A mechanical engineer known for his innovative work in mechanics and engineering during the medieval Islamic period.
    "khaldun", // Often regarded as the father of sociology, Ibn Khaldun was a historian, philosopher, and sociologist whose influential work laid the foundation for the study of social sciences and historiography.
    "khawarizmi", // Considered the father of algebra, he also made contributions to astronomy and geography.
    "khayyam", // Known for his contributions to mathematics, including his work on algebra and his famous "Rubaiyat" poetry.
    "kindi", // A philosopher and mathematician who made important contributions to philosophy, mathematics, and music theory.
    "rushd", // A philosopher and jurist who made significant contributions to Aristotelian philosophy and Islamic jurisprudence.
    "razi", // A physician known for his pioneering work in medicine and his book "The Book of Medicine."
    "sina", // A physician, philosopher, and polymath who made significant contributions to medicine and Islamic philosophy.
    "ulugh", // An astronomer known for his contributions to the field of astronomy. He made significant observations and calculations related to celestial objects and their movements, furthering our understanding of the universe.
    "zahrawi", // Often referred to as the "father of surgery," Zahrawi was a renowned physician, surgeon, and innovator in the field of medicine. He authored an influential medical encyclopedia known as "Al-Tasrif," which covered various aspects of medicine, surgery, and medical instruments.
];

static LOTR: &[&str] = &[
    "aragorn", // Heir to the throne of Gondor and one of the leaders in the fight against Sauron.
    "arwen",   // An elven princess and Aragorn's kind and loving love interest.
    "boromir", // A valiant warrior from Gondor and a member of the Fellowship of the Ring.
    "denethor", // The Steward of Gondor, who displays bravery and leadership in times of crisis.
    "eomer",   // The brave and skilled Marshal of the Riddermark and later King of Rohan.
    "eowyn", // The courageous and valiant shieldmaiden of Rohan who defeats the Witch-king of Angmar.
    "faramir", // The noble and wise younger brother of Boromir, who aids Frodo and Sam on their quest.
    "galadriel", // The powerful and wise Lady of Lothlórien, one of the oldest and wisest elves.
    "gandalf", // A wise and powerful wizard who plays a crucial role in the events of Middle-earth.
    "glorfindel", // A noble and heroic elf who aids Frodo on his journey to Rivendell.
    "legolas", // An elven prince and skilled archer who joins the Fellowship of the Ring.
    "elrond",  // The noble and wise Lord of Rivendell, half-elven and father of Arwen.
    "samwise", // Frodo's loyal and wise friend who supports him throughout the quest.
    "theoden", // The noble and wise King of Rohan who plays a pivotal role in the War of the Ring.
    "thranduil", // The Elvenking of Mirkwood, known for his bravery and archery skills.
];

#[derive(Parser)]
#[command(name = "names")]
pub struct Opts {
    /// Port number
    #[arg(value_enum)]
    pub figure: Figure,

    /// Indicate whether to terminate the app or not.
    #[arg(long)]
    pub with_adjective: bool,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Figure {
    Islamic,
    Lotr,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();
    print(opts.figure, opts.with_adjective)?;

    Ok(())
}

fn print(figure: Figure, with_adjective: bool) -> anyhow::Result<()> {
    let noun = match figure {
        Figure::Islamic => {
            let index = utils::get_random_number(ISLAMIC.len());
            ISLAMIC[index]
        }
        Figure::Lotr => {
            let index = utils::get_random_number(LOTR.len());
            LOTR[index]
        }
    };
    let name = match with_adjective {
        false => noun.to_owned(),
        true => {
            let index = utils::get_random_number(ADJECTIVES.len());
            format!("{}-{}", ADJECTIVES[index], noun)
        }
    };
    utils::stdout(&name);
    Ok(())
}
