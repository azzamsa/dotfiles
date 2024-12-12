use std::env;

use clap::Parser;
use duct::cmd;

use crate::utils;

#[derive(Parser)]
pub struct Opts {
    /// Current working directory
    pub cwd: Option<String>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let home = env::var("HOME")?;

    let opts = Opts::parse();
    match opts.cwd {
        None => here(&home)?,
        Some(cwd) => here(&cwd)?,
    };

    Ok(())
}

fn here(cwd: &str) -> anyhow::Result<()> {
    utils::stdout("Opening terminal in `{cwd}`");
    // cmd!("zellij", "action", "new-tab", "--layout", "default", "--cwd", cwd).run()?;
    cmd!("wezterm", "cli", "spawn", "--window-id", "0", "--cwd", cwd).run()?;
    Ok(())
}
