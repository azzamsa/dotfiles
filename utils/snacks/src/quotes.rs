use crate::utils;

static QUOTES: &[&str] = &[
    // Sarah Andersen
    "Practice. It is Practice. Practice.",
    "Do it scared.",
];

pub(crate) fn run() -> anyhow::Result<()> {
    let index = utils::get_random_number(QUOTES.len());
    let quotes = QUOTES[index];

    utils::stdout(quotes);

    Ok(())
}
