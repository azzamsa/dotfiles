/// Terminal Here
///
/// Open terminal in given directory.
///
/// Usage from other application:
/// ``` lisp
/// (defun terminal-here ()
///   (interactive)
///   (message "Opening terminal in %s" default-directory)
///   (start-process "" nil "termhere" default-directory))
/// ```
use std::env;

use clap::Parser;
use duct::cmd;

#[derive(Parser)]
#[command(name = "termhere")]
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
    println!("Opening terminal in `{cwd}`");
    cmd!("zellij", "action", "new-tab", "--layout", "default", "--cwd", cwd).run()?;
    Ok(())
}
