mod age;
mod backup;
mod clean;
mod cname;
mod ding;
mod sfetch;
mod termhere;
mod update;

type Tools<'a> = &'a [(&'a str, fn() -> anyhow::Result<()>)];
const TOOLS: Tools = &[
    ("age", age::run),
    ("backup", backup::run),
    ("clean", clean::run),
    ("cname", cname::run),
    ("ding", ding::run),
    ("sfetch", sfetch::run),
    ("termhere", termhere::run),
    ("update", update::run),
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
fn link_me_up() -> anyhow::Result<()> {
    use duct::cmd;

    let target = format!("{}/.local/bin", std::env::var("HOME")?);
    let target = std::path::Path::new(&target);
    cmd!("mkdir", "-p", target).run()?;
    cmd!("cargo", "build", "--release").run()?;

    for &(tool, _) in TOOLS {
        let dst = target.join(tool);
        cmd!("rm", "-rf", &dst).run()?;
        cmd!("ln", "./target/release/xtool", &dst).run()?;
    }
    Ok(())
}