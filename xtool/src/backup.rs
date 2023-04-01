use std::env;
use xshell::{cmd, Shell};

pub(crate) fn run(sh: &Shell) -> anyhow::Result<()> {
    backup(sh)?;
    prune(sh)?;
    Ok(())
}

fn backup(sh: &Shell) -> anyhow::Result<()> {
    let target = env::var("_META_BACKUP_INCLUDE")?;
    println!("🚀 Starting backup");

    let args = [
        "--verbose",
        "--exclude-caches",
        "--one-file-system",
        "backup",
        "--files-from",
        &target,
        // "--dry-run",
    ];
    cmd!(sh, "restic {args...}").run()?;

    println!("🍰 Backup finished");
    Ok(())
}

fn prune(sh: &Shell) -> anyhow::Result<()> {
    println!("🧹 Pruning old backup");

    let args = [
        "--verbose",
        "forget",
        "--prune",
        "--keep-daily",
        "2",
        "--keep-weekly",
        "2",
        "--keep-monthly",
        "2",
        // "--dry-run",
    ];
    cmd!(sh, "restic {args...}").run()?;

    println!("🍰 Prune finished");
    Ok(())
}
