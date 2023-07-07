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
    let mut args = pico_args::Arguments::from_env();
    let pwd: Option<String> = args.opt_free_from_str()?;

    let home = env::var("HOME")?;
    match pwd {
        None => here(&home)?,
        Some(p) => here(&p)?,
    };

    Ok(())
}

fn here(pwd: &str) -> anyhow::Result<()> {
    println!("Opening terminal in `{pwd}`");
    cmd!("zellij", "action", "new-tab", "--layout", "default", "--cwd", pwd).run()?;
    Ok(())
}
