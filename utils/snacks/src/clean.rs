use std::{env, fs, path::PathBuf};

use clap::{Parser, ValueEnum};
use duct::cmd;

use crate::utils;

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
    Dirs,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    match opts.tasks {
        None => run_all()?,
        Some(tasks) => run_some(tasks)?,
    }

    utils::stdout("✨ You have a new shiny machine!");
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
            Task::Dirs => dirs()?,
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
    dirs()?;
    Ok(())
}

fn kondo() -> anyhow::Result<()> {
    let home = env::var("HOME")?;

    utils::stdout("🧽 Cleaning dependencies and build artifacts");
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
    utils::stdout("🧽 Cleaning package manager cache");
    cmd!("sudo", "nala", "autoremove").run()?;
    Ok(())
}

fn flatpak() -> anyhow::Result<()> {
    utils::stdout("🧽 Cleaning unused flatpak package");
    cmd!("flatpak", "uninstall", "--unused").unchecked().run()?;
    Ok(())
}

fn cargo() -> anyhow::Result<()> {
    utils::stdout("🧽 Cleaning cargo cache");
    cmd!("cargo", "cache", "--autoclean").unchecked().run()?;
    Ok(())
}

fn container() -> anyhow::Result<()> {
    utils::stdout("🧽 Cleaning container cache");
    cmd!("podman", "system", "prune").unchecked().run()?;
    // cmd!("docker", "system", "prune").unchecked().run()?;
    Ok(())
}

fn dirs() -> anyhow::Result<()> {
    println!("🧽 Cleaning `~/Downloads`, `~/Pictures/Screenshot` dirs");
    let mut all_paths: Vec<PathBuf> = Vec::new();
    let home = env::var("HOME").unwrap();

    all_paths.extend(get_paths(&format!("{home}/Downloads")));
    all_paths.extend(get_paths(&format!("{home}/Pictures/Screenshots")));

    for path in all_paths {
        cmd!("rm", "-rf", path).run()?;
    }
    Ok(())
}

fn get_paths(dir: &str) -> Vec<PathBuf> {
    fs::read_dir(dir)
        .unwrap()
        .map(|p| p.unwrap().path())
        .collect::<Vec<PathBuf>>()
}
