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

use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    let flags = xflags::parse_or_exit! {
        optional pwd: String
    };

    let home = env::var("HOME")?;
    match flags.pwd {
        Some(p) => here(&p)?,
        None => here(&home)?,
    };

    Ok(())
}

fn here(pwd: &str) -> anyhow::Result<()> {
    println!("Opening terminal in `{pwd}`");
    cmd!("zellij", "action", "new-tab", "--layout", "default", "--cwd", pwd).run()?;
    Ok(())
}
