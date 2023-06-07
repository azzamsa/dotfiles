use std::{env, fs};

use duct::cmd;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
struct Image {
    id: String,
    names: Option<Vec<String>>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let mut args = pico_args::Arguments::from_env();
    let target: Option<String> = args.opt_free_from_str()?;

    match target {
        None => all()?,
        Some(t) => match t.as_ref() {
            "tmp" => tmp()?,
            _ => anyhow::bail!("unknown target: `{}`", t),
        },
    }
    println!("✨ You have a new shiny machine!");

    Ok(())
}

fn all() -> anyhow::Result<()> {
    tmp()?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!("kondo", "--older", "1M").unchecked().run()?;

    println!("🧽 Cleaning unused layer");
    cmd!("rpm-ostree", "cleanup", "--base").run()?;

    println!("🧽 Cleaning unused flatpak package");
    cmd!("flatpak", "uninstall", "--unused").unchecked().run()?;

    println!("🧽 Cleaning container cache");
    let images = cmd!("podman", "images", "--all", "--format=json").read()?;
    let images: Vec<Image> = serde_json::from_str(&images)?;
    for image in images {
        if image.names.is_none() {
            cmd!("podman", "rmi", &image.id, "--force").run()?;
        }
    }

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
