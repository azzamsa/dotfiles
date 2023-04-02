use std::{env, fs};
use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    let flags = xflags::parse_or_exit! {
        /// target
        optional target: String
    };

    match flags.target {
        Some(s) => match s.as_ref() {
            "tmp" => tmp(sh)?,
            _ => all(sh)?,
        },
        None => all(sh)?,
    };
    println!("✨ You have a new shiny machine!");

    Ok(())
}

fn all(sh: &Shell) -> anyhow::Result<()> {
    tmp(sh)?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!(sh, "kondo --older 1M --all").run()?;

    println!("🧽 Cleaning unused layer");
    cmd!(sh, "rpm-ostree cleanup --base").run()?;

    println!("🧽 Cleaning unused flatpak package");
    cmd!(sh, "flatpak uninstall --unused --assumeyes").run()?;

    println!("🧽 Cleaning dagling images");
    cmd!(sh, "podman system prune --force").run()?;

    Ok(())
}

fn tmp(sh: &Shell) -> anyhow::Result<()> {
    println!("🧽 Cleaning temporary files");
    let paths = fs::read_dir(format!("{}/.tmp", env::var("HOME")?))?;
    for path in paths {
        sh.remove_path(path?.path())?;
    }
    Ok(())
}
