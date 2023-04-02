use std::{env, fs};

use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    let flags = xflags::parse_or_exit! {
        optional target: String
    };

    match flags.target {
        Some(s) => match s.as_ref() {
            "tmp" => tmp()?,
            _ => anyhow::bail!("unknown target: `{}`", s),
        },
        None => all()?,
    };
    println!("✨ You have a new shiny machine!");

    Ok(())
}

fn all() -> anyhow::Result<()> {
    tmp()?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!("kondo", "--older", "1M").run()?;

    println!("🧽 Cleaning unused layer");
    cmd!("rpm-ostree", "cleanup", "--base").run()?;

    println!("🧽 Cleaning unused flatpak package");
    cmd!("flatpak", "uninstall", "--unused").run()?;

    println!("🧽 Cleaning dagling images");
    cmd!("podman", "system", "prune").run()?;

    Ok(())
}

fn tmp() -> anyhow::Result<()> {
    println!("🧽 Cleaning temporary files");
    let paths = fs::read_dir(format!("{}/.tmp", env::var("HOME")?))?;
    for path in paths {
        cmd!("rm", "-rf", path?.path()).run()?;
    }
    Ok(())
}
