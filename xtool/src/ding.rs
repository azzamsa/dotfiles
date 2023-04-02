use std::env;
use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    let target = format!("{}/music/notifications/ding.ogg", env::var("HOME")?);
    cmd!(sh, "pw-play {target}").run()?;
    Ok(())
}
