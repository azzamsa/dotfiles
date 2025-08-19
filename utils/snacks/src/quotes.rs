use clap::Parser;

use crate::utils;

static QUOTES: &[&str] = &[
    // Sarah Andersen
    "Practice. It is Practice. Practice",
    "Do it scared",
    "Done is better than perfect",
    "Do first things first",
    "We are what we repeatedly do",
    "Failure is success in progress",
    "One step at a time",
    "Action cures fear",
    "Don’t break the chain",
    "Discipline equals freedom",
];

#[derive(Parser)]
pub struct Opts {
    /// Wrap with quotes.
    #[arg(short, long)]
    pub quoted: bool,
    /// End with dot.
    #[arg(short, long)]
    pub period: bool,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    let index = utils::get_random_number(QUOTES.len());
    let mut quote = QUOTES[index].to_string();

    if opts.period {
        quote.push('.')
    };

    if opts.quoted {
        quote = format!(r#""{quote}""#);
    }

    utils::stdout(&quote);
    Ok(())
}
