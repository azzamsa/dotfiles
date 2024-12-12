use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    // Remove merged branch
    remove_merged_branch()?;
    // Remove outdated references
    prune()?;
    Ok(())
}

fn remove_merged_branch() -> anyhow::Result<()> {
    let branches = cmd!("git", "branch", "--merged").read()?;
    let branches: Vec<_> = branches
        .lines()
        .map(str::trim)
        // Exclude current branch
        .filter(|branch| !branch.starts_with('*'))
        // Exclude protected branches
        .filter(|branch| !["master", "main", "dev", "devel"].contains(branch))
        .collect();
    for branch in branches {
        cmd!("git", "branch", "-d", branch).run()?;
    }
    Ok(())
}

fn prune() -> anyhow::Result<()> {
    let remotes = cmd!("git", "remote").read()?;
    let remotes = remotes.lines();
    for remote in remotes {
        cmd!("git", "fetch", remote, "--prune").run()?;
    }
    Ok(())
}
