use xshell::Shell;

mod clean;
mod cname;
mod ding;
mod sfetch;
mod termhere;
mod update;

type Tools<'a> = &'a [(&'a str, fn(&Shell) -> anyhow::Result<()>)];
const TOOLS: Tools = &[
    ("sfetch", sfetch::run),
    ("clean", clean::run),
    ("update", update::run),
    ("ding", ding::run),
    ("cname", cname::run),
    ("termhere", termhere::run),
];

fn main() -> anyhow::Result<()> {
    let progn = std::env::args_os().next().unwrap_or_default();
    let progn = progn.to_str().unwrap_or_default();

    let (_name, run) = TOOLS
        .iter()
        .find(|&&(name, _run)| name == progn)
        .ok_or_else(|| anyhow::format_err!("unknown tool: `{}`", progn))?;
    let sh = Shell::new()?;
    run(&sh)
}

#[test]
fn link_me_up() -> anyhow::Result<()> {
    use xshell::{cmd, Shell};
    let sh = Shell::new()?;

    let target = format!("{}/.local/bin", std::env::var("HOME")?);
    let bin = std::path::Path::new(&target);
    sh.create_dir(bin)?;
    cmd!(sh, "cargo build --release").run()?;

    for &(tool, _) in TOOLS {
        let dst = bin.join(tool);
        sh.remove_path(&dst)?;
        sh.hard_link("./target/release/xtool", &dst)?;
    }

    Ok(())
}
