/// Fish completions
///
/// Copy the code below to `~/.config/fish/completions/in.fish`.
/// ```
/// # out.fish - Fish shell completions for the 'out' command
///
/// complete -c out -n "__fish_use_subcommand" -l nala -d "Use 'nala' as package manager"
/// complete -c out -n "__fish_use_subcommand" -l cargo -d "Use 'cargo' as package manager"
/// complete -c out -n "__fish_use_subcommand" -l rye -d "Use 'rye' as package manager"
/// complete -c out -s h -l help -d "Print help"
/// ```
use clap::Parser;
use duct::cmd;

#[derive(Debug, Parser)]
#[command(name = "out")]
pub struct Opts {
    /// Package name
    package: String,

    /// Use `nala` as package manager
    #[arg(long)]
    nala: bool,

    /// Use `cargo` as package manager
    #[arg(long)]
    cargo: bool,

    /// Use `rye` as package manager
    #[arg(long)]
    rye: bool,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();
    let package_name = &opts.package;

    if opts.nala {
        cmd!("sudo", "nala", "purge", package_name).run()?;
    } else if opts.cargo {
        cmd!("cargo", "uninstall", package_name).run()?;
    } else if opts.rye {
        cmd!(
            "python3",
            "-m",
            "pip",
            "--default-timeout=1000",
            "uninstall",
            package_name
        )
        .run()?;
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}
