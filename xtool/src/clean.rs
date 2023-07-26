use std::{env, fs};

use clap::{Parser, ValueEnum};
use duct::cmd;
use serde::Deserialize;

#[derive(Parser)]
#[command(name = "upgrade")]
pub struct Opts {
    /// Port number
    #[arg(value_enum)]
    pub modules: Option<Vec<Module>>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Module {
    Kondo,
    PackageManager,
    Flatpak,
    Container,
    Tmp,
}

#[derive(Debug, Deserialize)]
#[serde(rename_all = "PascalCase")]
struct Image {
    id: String,
    names: Option<Vec<String>>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    match opts.modules {
        None => all()?,
        Some(modules) => execute(modules)?,
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}

fn execute(modules: Vec<Module>) -> anyhow::Result<()> {
    for module in modules {
        match module {
            Module::Kondo => kondo()?,
            Module::PackageManager => package_manager()?,
            Module::Flatpak => flatpak()?,
            Module::Container => container()?,
            Module::Tmp => tmp()?,
        }
    }
    Ok(())
}

fn all() -> anyhow::Result<()> {
    kondo()?;
    package_manager()?;
    flatpak()?;
    container()?;
    tmp()?;
    Ok(())
}

fn kondo() -> anyhow::Result<()> {
    let home = env::var("HOME")?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!(
        "kondo",
        &home,
        "--older",
        "1M",
        "--ignored-dirs",
        format!("{}/opt/nodebin", &home)
    )
    .unchecked()
    .run()?;
    Ok(())
}

fn package_manager() -> anyhow::Result<()> {
    println!("🧽 Cleaning package manager cache");
    cmd!("sudo", "nala", "autoremove").run()?;
    cmd!("sudo", "nala", "autopurge").run()?;
    Ok(())
}

fn flatpak() -> anyhow::Result<()> {
    println!("🧽 Cleaning unused flatpak package");
    cmd!("flatpak", "uninstall", "--unused").unchecked().run()?;
    Ok(())
}

fn container() -> anyhow::Result<()> {
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
    let paths = fs::read_dir(format!("{}/tmp", env::var("HOME")?))?;
    for path in paths {
        cmd!("rm", "-rf", path?.path()).run()?;
    }
    Ok(())
}
