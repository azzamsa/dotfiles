use std::env;
use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    exec(sh)?;
    println!("✨ You have a new shiny machine!");

    Ok(())
}

fn exec(sh: &Shell) -> anyhow::Result<()> {
    println!("🌱 Updating flatpak apps");
    cmd!(sh, "flatpak update").run()?;

    println!("🌱 Upgrading system");
    cmd!(sh, "rpm-ostree upgrade --preview").run()?;

    println!("🌱 Checking node apps");
    {
        let _d = sh.push_dir(format!("{}/opt/nodebin", env::var("HOME")?));
        cmd!(sh, "taze major --write").run()?;
        cmd!(sh, "npm i").run()?;
    }

    println!("🌱 Checking rust apps");
    cmd!(sh, "rustup check").run()?;
    cmd!(sh, "cargo install-update -a").run()?;

    Ok(())
}
