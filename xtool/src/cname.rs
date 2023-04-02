/// Container Name
use std::{fs, io, process};

use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    if is_inside_container().is_err() {
        process::exit(1);
    };

    let env = fs::read_to_string("/run/.containerenv")?;
    let name = env
        .split_once("name=\"")
        .and_then(|it| it.1.split_once('\"'))
        .map(|it| it.0)
        .ok_or_else(|| anyhow::format_err!("can't find name field in the env file"))?;
    println!("{}", name);

    Ok(())
}

fn is_inside_container() -> Result<String, io::Error> {
    cmd!("test", "-e", "/run/.containerenv").read()
}
