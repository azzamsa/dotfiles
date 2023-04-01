/// Container Name
use std::fs;
use std::process;
use xshell::{cmd, Error, Shell};

fn is_inside_container(sh: &Shell) -> Result<String, Error> {
    cmd!(sh, "test -e /run/.containerenv").read()
}

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    if is_inside_container(sh).is_err() {
        process::exit(1);
    };

    let env = fs::read_to_string("/run/.containerenv")?;
    let env: Vec<_> = env.lines().collect();
    let name = env.iter().find(|x| x.contains("name"));
    if let Some(name) = name {
        println!("{}", name.replace('"', "").replace("name=", ""));
    }
    Ok(())
}
