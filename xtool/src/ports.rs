use duct::cmd;

#[derive(Debug)]
struct AppArgs {
    port: String,
    kill: bool,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let args = match parse_args() {
        Ok(v) => v,
        Err(e) => {
            eprintln!("Error a: {}.", e);
            std::process::exit(1);
        }
    };

    if args.kill {
        kill(&args.port)?
    } else {
        proc_name(&args.port)?
    }

    Ok(())
}

fn parse_args() -> Result<AppArgs, pico_args::Error> {
    let mut pargs = pico_args::Arguments::from_env();
    let args = AppArgs {
        port: pargs.free_from_str()?,
        kill: pargs.contains(["-k", "--kill"]),
    };

    Ok(args)
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
