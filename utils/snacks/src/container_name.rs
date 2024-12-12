use std::fs;
use std::path::Path;

use toml::Table;

use crate::utils;

pub(crate) fn run() -> anyhow::Result<()> {
    let container_env = Path::new("/run/.containerenv");

    // Check if the file exists
    if !container_env.exists() {
        anyhow::bail!("Exiting. Not inside a container");
    }

    let content = fs::read_to_string(container_env)?;
    let value = content.parse::<Table>()?;
    utils::stdout(value["name"].as_str().unwrap_or(""));

    Ok(())
}
