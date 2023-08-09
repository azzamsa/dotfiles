use std::env;
use std::fs;

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
    #[clap(name = "pm")]
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
    cmd!(
        "flatpak",
        "update",
        "io.gitlab.news_flash.NewsFlash",
        "com.github.johnfactotum.Foliate",
        "com.logseq.Logseq",
        "org.atheme.audacious",
        "org.keepassxc.KeePassXC",
        "org.mozilla.Thunderbird",
        "rest.insomnia.Insomnia",
        "--no-related"
    )
    .unchecked()
    .run()?;
    Ok(())
}

fn package_manager() -> anyhow::Result<()> {
    println!("📥 Upgrading OS package manager apps");
    let package_manager = get_package_manager_name();
    match package_manager {
        None => anyhow::bail!("built-in package manager not found"),
        Some(pm) => {
            cmd!("sudo", pm, "upgrade").unchecked().run()?;
        }
    }
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

fn get_package_manager_name() -> Option<String> {
    match get_os_name() {
        None => None,
        Some(name) => {
            if name.contains("Fedora") {
                Some("dnf".to_string())
            } else if name.contains("Debian") {
                Some("apt".to_string())
            } else {
                None
            }
        }
    }
}

fn get_os_name() -> Option<String> {
    if let Ok(contents) = fs::read_to_string("/etc/os-release") {
        for line in contents.lines() {
            if let Some(name) = line.strip_prefix("NAME=") {
                // Extract the name value and remove quotes if present
                let name = name.trim().trim_matches('"').to_string();
                return Some(name);
            }
        }
    }
    None
}
