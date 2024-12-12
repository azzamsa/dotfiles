mod clean;
mod container_name;
mod emojis;
mod git_gone;
mod names;
mod ports;
mod termhere;
mod up;

type Tools<'a> = &'a [(&'a str, fn() -> anyhow::Result<()>)];
const TOOLS: Tools = &[
    ("clean", clean::run),
    ("container_name", container_name::run),
    ("emojis", emojis::run),
    ("git_gone", git_gone::run),
    ("names", names::run),
    ("ports", ports::run),
    ("termhere", termhere::run),
    ("up", up::run),
];

fn main() -> anyhow::Result<()> {
    let progn = std::env::args_os().next().unwrap_or_default();
    let progn = progn.to_str().unwrap_or_default();

    let (_name, run) = TOOLS
        .iter()
        .find(|&&(name, _run)| name == progn)
        .ok_or_else(|| anyhow::format_err!("unknown tool: `{}`", progn))?;
    run()
}

#[test]
fn deploy() -> anyhow::Result<()> {
    use duct::cmd;

    let target = format!("{}/.local/bin", std::env::var("HOME")?);
    let target = std::path::Path::new(&target);
    cmd!("mkdir", "-p", target).run()?;
    cmd!("cargo", "build", "--release").run()?;

    for &(tool, _) in TOOLS {
        let dst = target.join(tool);
        cmd!("rm", "-rf", &dst).run()?;
        cmd!("ln", "./target/release/snacks", &dst).run()?;
    }
    Ok(())
}
