use xshell::{cmd, Shell};

fn home() -> anyhow::Result<String> {
    Ok(std::env::var("HOME")?)
}

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    let target = [format!("{}/music/notifications/ding.ogg", home()?)];
    cmd!(sh, "pw-play {target...}").run()?;
    Ok(())
}
