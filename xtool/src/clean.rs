use std::{env, fs};

use duct::cmd;
use lexopt::prelude::*;
use serde::Deserialize;

pub(crate) fn run() -> anyhow::Result<()> {
    let mut parser = lexopt::Parser::from_env();
    if let Some(arg) = parser.next()? {
        match arg {
            Value(value) => {
                let value = value.string()?;
                match value.as_str() {
                    "tmp" => {
                        return tmp();
                    }
                    value => {
                        return Err(anyhow::anyhow!("unknown subcommand '{}'", value));
                    }
                }
            }
            _ => return Err(anyhow::anyhow!(arg.unexpected())),
        }
    } else {
        all()?;
    }
    println!("✨ You have a new shiny machine!");

    Ok(())
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
struct Image {
    id: String,
    names: Option<Vec<String>>,
}

fn all() -> anyhow::Result<()> {
    tmp()?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!("kondo", "--older", "1M").unchecked().run()?;

    println!("🧽 Cleaning unused layer");
    cmd!("sudo", "dnf", "autoremove").run()?;

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
    let paths = fs::read_dir(format!("{}/Downloads", env::var("HOME")?))?;
    for path in paths {
        cmd!("rm", "-rf", path?.path()).run()?;
    }
    Ok(())
}
