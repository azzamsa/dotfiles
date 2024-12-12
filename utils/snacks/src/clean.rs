use std::env;

use clap::{Parser, ValueEnum};
use duct::cmd;

#[derive(Parser)]
pub struct Opts {
    /// Task
    #[arg(value_enum)]
    pub tasks: Option<Vec<Task>>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Task {
    Kondo,
    #[clap(name = "pm")]
    PackageManager,
    Flatpak,
    Container,
    Cargo,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    match opts.tasks {
        None => run_all()?,
        Some(tasks) => run_some(tasks)?,
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}

fn run_some(tasks: Vec<Task>) -> anyhow::Result<()> {
    for task in tasks {
        match task {
            Task::Kondo => kondo()?,
            Task::PackageManager => package_manager()?,
            Task::Flatpak => flatpak()?,
            Task::Container => container()?,
            Task::Cargo => cargo()?,
        }
    }
    Ok(())
}

fn run_all() -> anyhow::Result<()> {
    kondo()?;
    package_manager()?;
    flatpak()?;
    container()?;
    cargo()?;
    Ok(())
}

fn kondo() -> anyhow::Result<()> {
    let home = env::var("HOME")?;

    println!("🧽 Cleaning dependencies and build artifacts");
    cmd!(
        "kondo",
        &home,
        "--older",
        "2w",
        "--ignored-dirs",
        format!("{}/opt/nodebin", &home),
        "--all",
    )
    .unchecked()
    .run()?;
    Ok(())
}

fn package_manager() -> anyhow::Result<()> {
    println!("🧽 Cleaning package manager cache");
    cmd!("sudo", "dnf", "autoremove").run()?;
    Ok(())
}

fn flatpak() -> anyhow::Result<()> {
    println!("🧽 Cleaning unused flatpak package");
    cmd!("flatpak", "uninstall", "--unused").unchecked().run()?;
    Ok(())
}

fn cargo() -> anyhow::Result<()> {
    println!("🧽 Cleaning cargo cache");
    cmd!("cargo", "cache", "--autoclean").unchecked().run()?;
    Ok(())
}

fn container() -> anyhow::Result<()> {
    println!("🧽 Cleaning container cache");
    cmd!("podman", "system", "prune").unchecked().run()?;
    cmd!("docker", "system", "prune").unchecked().run()?;
    Ok(())
}
