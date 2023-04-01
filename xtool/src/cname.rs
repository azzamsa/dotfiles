/// Container Name
use std::process;
use xshell::{cmd, Error, Shell};

fn is_inside_container(sh: &Shell) -> Result<String, Error> {
    cmd!(sh, "test -e /run/.containerenv").read()
}

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    if is_inside_container(sh).is_err() {
        process::exit(1);
    };

    let env = sh.read_file("/run/.containerenv")?;
    let name = env
        .split_once("name=\"")
        .and_then(|it| it.1.split_once('\"'))
        .map(|it| it.0)
        .ok_or_else(|| anyhow::format_err!("can't find name field in the env file"))?;
    println!("{}", name);

    Ok(())
}
