/// Fish completions
///
/// Copy the code below to `~/.config/fish/completions/in.fish`.
/// ```
/// # out.fish - Fish shell completions for the 'out' command
///
/// complete -c in -n "__fish_use_subcommand" -s n -l nala -d "Use 'nala' as package manager"
/// complete -c in -n "__fish_use_subcommand" -s c -l cargo -d "Use 'cargo' as package manager"
/// complete -c in -n "__fish_use_subcommand" -s r -l rye -d "Use 'rye' as package manager"
/// complete -c in -s h -l help -d "Print help"
/// ```
use clap::Parser;
use duct::cmd;

#[derive(Parser)]
#[command(name = "in")]
pub struct Opts {
    /// Package name
    pub package: String,

    /// Use `nala` as package manager
    #[arg(short, long)]
    nala: bool,

    /// Use `cargo` as package manager
    #[arg(short, long)]
    cargo: bool,

    /// Use `rye` as package manager
    #[arg(short, long)]
    rye: bool,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();
    let package_name = &opts.package;

    if opts.nala {
        cmd!("sudo", "nala", "install", package_name).run()?;
    } else if opts.cargo {
        cmd!(
            "cargo",
            "binstall",
            "--no-confirm",
            "--no-symlinks",
            package_name
        )
        .run()?;
    } else if opts.rye {
        cmd!("rye", "install", opts.package).run()?;
    }

    Ok(())
}
