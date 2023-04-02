use duct::cmd;
use std::env;

pub(crate) fn run() -> anyhow::Result<()> {
    let target = format!("{}/music/notifications/ding.ogg", env::var("HOME")?);
    cmd!("pw-play", target).run()?;
    Ok(())
}
