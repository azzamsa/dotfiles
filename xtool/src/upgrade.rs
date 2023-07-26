use std::env;

use clap::{Parser, ValueEnum};
use duct::cmd;

#[derive(Parser)]
#[command(name = "upgrade")]
pub struct Opts {
    /// Port number
    #[arg(value_enum)]
    pub modules: Option<Vec<Module>>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Module {
    Flatpak,
    PackageManager,
    Npm,
    Cargo,
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
            Module::Flatpak => flatpak()?,
            Module::PackageManager => package_manager()?,
            Module::Npm => npm()?,
            Module::Cargo => cargo()?,
        }
    }
    Ok(())
}

fn all() -> anyhow::Result<()> {
    flatpak()?;
    package_manager()?;
    npm()?;
    cargo()?;
    Ok(())
}

fn flatpak() -> anyhow::Result<()> {
    println!("📥 Updating flatpak apps");
    cmd!("flatpak", "update").unchecked().run()?;
    Ok(())
}

fn package_manager() -> anyhow::Result<()> {
    println!("📥 Upgrading OS package manager apps");
    cmd!("sudo", "nala", "upgrade").unchecked().run()?;
    Ok(())
}

fn npm() -> anyhow::Result<()> {
    println!("📥 Checking npm apps");
    let dir = format!("{}/opt/nodebin", env::var("HOME")?);
    cmd!("taze", "major", "--write").dir(&dir).run()?;
    cmd!("npm", "install").dir(&dir).run()?;
    Ok(())
}

fn cargo() -> anyhow::Result<()> {
    println!("📥 Checking cargo apps");
    cmd!("cargo", "install-update", "-a").run()?;
    Ok(())
}
