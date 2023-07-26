use clap::Parser;
use duct::cmd;

#[derive(Parser)]
#[command(name = "install")]
pub struct Opts {
    /// Use `nala` as package manager
    #[arg(long)]
    nala: bool,

    /// Use `cargo` as package manager
    #[arg(long)]
    cargo: bool,

    /// Use `rye` as package manager
    #[arg(long)]
    rye: bool,

    /// Package name
    pub package: String,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    if opts.nala {
        cmd!("sudo", "nala", "install", opts.package).run()?;
    } else if opts.cargo {
        cmd!(
            "cargo",
            "binstall",
            "--no-confirm",
            "--no-symlinks",
            opts.package
        )
        .run()?;
    } else if opts.rye {
        cmd!("rye", "install", opts.package).run()?;
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}
