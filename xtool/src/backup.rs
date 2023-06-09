use std::env;

use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    backup()?;
    prune()?;
    Ok(())
}

fn backup() -> anyhow::Result<()> {
    let target = env::var("_META_BACKUP_INCLUDE")?;
    let exclude_list = env::var("_META_BACKUP_EXCLUDE")?;
    println!("🚀 Starting backup");

    // "--dry-run"
    cmd!(
        "restic",
        "--verbose",
        "--exclude-caches",
        "--one-file-system",
        "backup",
        "--files-from",
        &target,
        "--exclude-file",
        exclude_list,
    )
    .run()?;

    println!("🍰 Backup finished");
    Ok(())
}

fn prune() -> anyhow::Result<()> {
    println!("🧹 Pruning old backup");

    // "--dry-run"
    cmd!(
        "restic",
        "--verbose",
        "forget",
        "--prune",
        "--keep-daily",
        "2",
        "--keep-weekly",
        "2",
        "--keep-monthly",
        "2"
    )
    .run()?;

    println!("🍰 Prune finished");
    Ok(())
}
