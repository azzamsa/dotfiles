use rand::Rng;

pub(crate) fn run() -> anyhow::Result<()> {
    // https://github.com/zellij-org/zellij/pull/2122
    let adjectives = &[
        "adamant",
        "adept",
        "adventurous",
        "auspicious",
        "awesome",
        "blossoming",
        "brave",
        "charming",
        "circular",
        "considerate",
        "curious",
        "delighted",
        "didactic",
        "diligent",
        "effulgent",
        "erudite",
        "excellent",
        "exquisite",
        "fabulous",
        "fascinating",
        "friendly",
        "glowing",
        "gracious",
        "gregarious",
        "hopeful",
        "inventive",
        "joyous",
        "judicious",
        "jumping",
        "kind",
        "likable",
        "loyal",
        "lucky",
        "marvellous",
        "mellifluous",
        "outstanding",
        "polished",
        "polite",
        "profound",
        "quiet",
        "remarkable",
        "sensible",
        "sincere",
        "sparkling",
        "splendid",
        "stellar",
        "tenacious",
        "tremendous",
        "triangular",
        "undulating",
        "unflappable",
        "unique",
        "verdant",
        "vitreous",
        "zippy",
    ];
    // https://en.wikipedia.org/wiki/List_of_scientists_in_medieval_Islamic_world
    let nouns = &[
        "astrulabi",  // made the astrolabe
        "bajja",      // scientist
        "banumusa",   // programmable machine
        "battani",    // mathematician
        "battuta",    // traveller
        "firhi",      // founder of first university
        "firnas",     // performer of the first flight
        "haitsam",    // astronomer
        "haytham",    // inventor of camera
        "idrisi",     // drawn the first map of the world
        "jazair",     // mechanical engineer
        "khaldun",    // the father of sociology
        "khawarizmi", // inventor of numerals
        "khayyam",    // scientist
        "rushd",      // scientist
        "sina",       // scientist
        "ulugh",      // astronomer
        "zahrawi",    // father of surgery
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
