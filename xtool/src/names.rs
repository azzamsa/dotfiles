use rand::Rng;

pub(crate) fn run() -> anyhow::Result<()> {
    let adjectives = &[
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

    let nouns = &[
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
    let adjective = adjectives[get_random_number(adjectives.len())];
    let noun = nouns[get_random_number(nouns.len())];
    println!("{}-{}", adjective, noun);
    Ok(())
}

fn get_random_number(length: usize) -> usize {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..length)
}
