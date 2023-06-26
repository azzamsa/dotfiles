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
use lexopt::prelude::*;

pub(crate) fn run() -> anyhow::Result<()> {
    let home = env::var("HOME")?;

    let mut parser = lexopt::Parser::from_env();
    if let Some(arg) = parser.next()? {
        match arg {
            Value(value) => {
                let value = value.string()?;
                return here(value.as_str());
            }
            _ => return Err(anyhow::anyhow!(arg.unexpected())),
        }
    } else {
        here(&home)?;
    }

    Ok(())
}

fn here(pwd: &str) -> anyhow::Result<()> {
    println!("Opening terminal in `{pwd}`");
    cmd!("zellij", "action", "new-tab", "--layout", "default", "--cwd", pwd).run()?;
    Ok(())
}
