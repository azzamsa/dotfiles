use duct::cmd;

pub(crate) fn run() -> anyhow::Result<()> {
    cmd!(
        "neofetch",
        "--off",
        "--disable",
        "title",
        "model",
        "uptime",
        "packages",
        "resolution",
        "cpu",
        "gpu",
        "memory",
        "theme",
        "icons",
        "term",
        "wm_theme",
        "cols"
    )
    .run()?;

    let mut emacs_version = cmd!(
        "emacs",
        "--quick",
        "--batch",
        "--eval",
        " (print (version))"
    )
    .read()?;
    emacs_version = emacs_version.replace('\n', "");
    emacs_version = emacs_version.replace('"', "");
    println!("Emacs version: {}", emacs_version);

    Ok(())
}
