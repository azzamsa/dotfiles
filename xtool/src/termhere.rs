/// Terminal Here
///
/// Open terminal in given directory.
///
/// Usage:
///
/// ```
/// $ termhere "/opt"
/// ```
///
/// Usage from other application:
///
/// ``` lisp
/// (defun terminal-here ()
///   (interactive)
///   (message "Opening terminal in %s" default-directory)
///   (start-process "" nil "zellij-here" default-directory))
/// ```
use std::env;
use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    let flags = xflags::parse_or_exit! {
        optional pwd: String
    };

    let home = env::var("HOME")?;
    match flags.pwd {
        Some(p) => here(sh, &p)?,
        None => here(sh, &home)?,
    };

    Ok(())
}

fn here(sh: &Shell, pwd: &str) -> anyhow::Result<()> {
    let args = ["--layout", "default", "--cwd", pwd];
    println!("Opening terminal in `{pwd}`");
    cmd!(sh, "zellij action new-tab {args...}").run()?;
    Ok(())
}
