use duct::cmd;
use lexopt::prelude::*;

#[derive(Debug)]
struct AppArgs {
    port: String,
    kill: Option<bool>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let args = match parse_args() {
        Ok(v) => v,
        Err(e) => {
            eprintln!("Error: {}.", e);
            std::process::exit(1);
        }
    };

    if args.kill.is_some() {
        kill(&args.port)?
    } else {
        proc_name(&args.port)?
    }

    Ok(())
}

fn parse_args() -> Result<AppArgs, lexopt::Error> {
    let mut port = None;
    let mut kill = None;


    let mut parser = lexopt::Parser::from_env();
    while let Some(arg) = parser.next()? {
        match arg {
            Short('k') | Long("kill") => {
                kill = Some(true);
            }
            Value(p) => port = Some(p.string()?),
            _ => return Err(arg.unexpected()),
        }
    }
    Ok(AppArgs {
        port: port.ok_or("missing required argument PORT")?,
        kill,
    })

}

fn proc_name(port: &str) -> anyhow::Result<()> {
    let port = format!("-i:{}", port);
    cmd!("lsof", port).run()?;

    Ok(())
}

fn kill(port: &str) -> anyhow::Result<()> {
    println!("Killing proccess at port {}", &port);
    let port = format!("-i:{}", port);
    let pid = cmd!("lsof", "-t", port).read()?;
    cmd!("kill", pid).run()?;

    Ok(())
}
