use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    let target = [format!("{}/music/notifications/ding.ogg", home()?)];
    cmd!(sh, "pw-play {target...}").run()?;
    Ok(())
}

fn home() -> anyhow::Result<String> {
    Ok(std::env::var("HOME")?)
}
