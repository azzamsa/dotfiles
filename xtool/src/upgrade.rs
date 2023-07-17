use std::{env, ffi::OsString};

use duct::cmd;

const HELP: &str = "\
upgrade

USAGE:
  upgrade [MODULES]

MODULES:
  flatpak pm npm cargo
";

#[derive(Debug)]
enum Modules {
    Flatpak,
    PackageManager,
    Npm,
    Cargo,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let mut args: Vec<_> = std::env::args_os().collect();
    args.remove(0); // remove the executable path.
    let mut args = pico_args::Arguments::from_vec(args);

    // Help has a higher priority and should be handled separately.
    if args.contains(["-h", "--help"]) {
        print!("{}", HELP);
        std::process::exit(0);
    }

    let mut valid_mods: Vec<Modules> = Vec::new();
    let mut invalid_mods: Vec<String> = Vec::new();

    let remaining = args.finish();
    if !remaining.is_empty() {
        parse_modules(remaining, &mut valid_mods, &mut invalid_mods)?;
        execute(valid_mods, invalid_mods)?;
    } else {
        all()?;
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}

fn execute(valid_mods: Vec<Modules>, invalid_mods: Vec<String>) -> anyhow::Result<()> {
    if !invalid_mods.is_empty() {
        anyhow::bail!("Unknown modules `{}`", &invalid_mods.join(", "))
    } else {
        for module in valid_mods {
            match module {
                Modules::Flatpak => flatpak()?,
                Modules::PackageManager => package_manager()?,
                Modules::Npm => npm()?,
                Modules::Cargo => cargo()?,
            }
        }
    }
    Ok(())
}

fn parse_modules(
    modules: Vec<OsString>,
    valid_mods: &mut Vec<Modules>,
    invalid_mods: &mut Vec<String>,
) -> anyhow::Result<()> {
    for module in modules {
        match module.to_string_lossy().to_string().to_lowercase().as_str() {
            "flatpak" => valid_mods.push(Modules::Flatpak),
            "pm" => valid_mods.push(Modules::PackageManager),
            "npm" => valid_mods.push(Modules::Npm),
            "cargo" => valid_mods.push(Modules::Cargo),
            _ => invalid_mods.push(module.to_string_lossy().to_string()),
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
    println!("🌱 Updating flatpak apps");
    cmd!("flatpak", "update").unchecked().run()?;
    Ok(())
}

fn package_manager() -> anyhow::Result<()> {
    println!("🌱 Upgrading OS package manager apps");
    cmd!("sudo", "nala", "update").unchecked().run()?;
    cmd!("sudo", "nala", "upgrade").unchecked().run()?;
    Ok(())
}

fn npm() -> anyhow::Result<()> {
    println!("🌱 Checking npm apps");
    let dir = format!("{}/opt/nodebin", env::var("HOME")?);
    cmd!("taze", "major", "--write").dir(&dir).run()?;
    cmd!("npm", "install").dir(&dir).run()?;
    Ok(())
}

fn cargo() -> anyhow::Result<()> {
    println!("🌱 Checking cargo apps");
    cmd!("cargo", "install-update", "-a").run()?;
    Ok(())
}
