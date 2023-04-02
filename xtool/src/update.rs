use std::env;

use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    exec()?;
    println!("✨ You have a new shiny machine!");

    Ok(())
}

fn exec() -> anyhow::Result<()> {
    println!("🌱 Updating flatpak apps");
    cmd!("flatpak", "update").run()?;

    println!("🌱 Upgrading system");
    cmd!("rpm-ostree", "upgrade", "--preview").run()?;

    println!("🌱 Checking node apps");
    let dir = format!("{}/opt/nodebin", env::var("HOME")?);
    cmd!("taze", "major", "--write").dir(&dir).run()?;
    cmd!("npm", "install").dir(&dir).run()?;

    println!("🌱 Checking rust apps");
    cmd!("rustup", "check").run()?;
    cmd!("cargo", "install-update", "-a").run()?;

    Ok(())
}
