use std::{env, ffi::OsString, fs};

use duct::cmd;
use serde::Deserialize;

const HELP: &str = "\
clean

USAGE:
  clean [MODULES]

MODULES:
  kondo pm flatpak container tmp
";

#[derive(Debug)]
enum Modules {
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
                Modules::Kondo => kondo()?,
                Modules::PackageManager => package_manager()?,
                Modules::Flatpak => flatpak()?,
                Modules::Container => container()?,
                Modules::Tmp => tmp()?,
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
            "kondo" => valid_mods.push(Modules::Kondo),
            "pm" => valid_mods.push(Modules::PackageManager),
            "flatpak" => valid_mods.push(Modules::Flatpak),
            "container" => valid_mods.push(Modules::Container),
            "tmp" => valid_mods.push(Modules::Tmp),
            _ => invalid_mods.push(module.to_string_lossy().to_string()),
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
