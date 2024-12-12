use clap::Parser;
use duct::cmd;

#[derive(Parser)]
pub struct Opts {
    /// Port number
    pub port: String,

    /// Indicate whether to terminate the app or not.
    #[arg(long)]
    pub kill: bool,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    if opts.kill {
        kill(&opts.port)?
    } else {
        proc_name(&opts.port)?
    }

    Ok(())
}

fn proc_name(port: &str) -> anyhow::Result<()> {
    let port = format!("-i:{}", port);
    cmd!("lsof", port).run()?;

    Ok(())
}

fn kill(port: &str) -> anyhow::Result<()> {
    println!("Killing process at port {}", &port);
    let port = format!("-i:{}", port);
    let pid = cmd!("lsof", "-t", port).read()?;
    cmd!("kill", pid).run()?;

    Ok(())
}
