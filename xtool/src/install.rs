use clap::{Args, CommandFactory, Parser, Subcommand};
use clap_complete::{generate, generate_to, Shell};
use duct::cmd;

#[derive(Debug, Parser)]
#[command(name = "in")]
pub struct Opts {
    #[command(subcommand)]
    command: Cmd,
}

#[derive(Debug, Subcommand)]
enum Cmd {
    Install(InstallArgs),
    GenCompletions(GenCompletionsArgs),
}

#[derive(Debug, Args)]
struct InstallArgs {
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

#[derive(Debug, Args)]
struct GenCompletionsArgs {
    /// Set the shell for generating completions
    #[arg(long, short)]
    shell: Shell,

    /// Set the output directory
    #[arg(long, short)]
    out_dir: Option<String>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    match &opts.command {
        Cmd::Install(opts) => install(opts)?,
        Cmd::GenCompletions(opts) => generate_completions(opts)?,
    };
    Ok(())
}

fn install(opts: &InstallArgs) -> anyhow::Result<()> {
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
        cmd!("rye", "install", package_name).run()?;
    }

    println!("✨ You have a new shiny machine!");
    Ok(())
}

fn generate_completions(opts: &GenCompletionsArgs) -> anyhow::Result<()> {
    let shell = opts.shell;
    let mut cmd = Opts::command();
    let app_name = cmd.get_name().to_string();

    match &opts.out_dir {
        Some(out_dir) => {
            generate_to(shell, &mut cmd, app_name, out_dir)?;
        }
        None => {
            generate(shell, &mut cmd, app_name, &mut std::io::stdout());
        }
    }

    Ok(())
}
