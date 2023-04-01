use std::env;
use xshell::Shell;

use humantime::{format_duration, parse_duration};
use time::{format_description, Date, Duration, OffsetDateTime};

pub(crate) fn run(_sh: &Shell) -> anyhow::Result<()> {
    dob()?;
    println!();
    marriage()?;
    println!();
    work()?;

    Ok(())
}

fn dob() -> anyhow::Result<()> {
    let birthday = env::var("_META_AGE_DOB")?;

    println!("👶 Born");
    let format = format_description::parse("[year]-[month]-[day]")?;
    let birthday = Date::parse(&birthday, &format)?;
    let now = OffsetDateTime::now_local()?.date();
    let age: Duration = now - birthday;

    let format =
        format_description::parse("[weekday repr:short], [day] [month repr:short] [year]")?;
    let birthday = birthday.format(&format)?;
    println!("You were born at: {}", birthday);

    let age = parse_duration(format!("{}", age).as_ref())?;
    println!("You are: {}", format_duration(age));

    Ok(())
}

fn marriage() -> anyhow::Result<()> {
    let marriage = env::var("_META_AGE_MARRIAGE")?;

    println!("💍 Marriage");
    let format = format_description::parse("[year]-[month]-[day]")?;
    let marriage = Date::parse(&marriage, &format)?;
    let now = OffsetDateTime::now_local()?.date();
    let age: Duration = now - marriage;

    let format =
        format_description::parse("[weekday repr:short], [day] [month repr:short] [year]")?;
    let marriage = marriage.format(&format)?;
    println!("You marriage at: {}", marriage);

    let age = parse_duration(format!("{}", age).as_ref())?;
    println!("It has been: {}", format_duration(age));

    Ok(())
}

fn work() -> anyhow::Result<()> {
    let company = env::var("_META_AGE_COMPANY")?;
    let work = env::var("_META_AGE_WORK")?;

    println!("🛠  Work️");
    let format = format_description::parse("[year]-[month]-[day]")?;
    let work = Date::parse(&work, &format)?;
    let now = OffsetDateTime::now_local()?.date();
    let age: Duration = now - work;

    let format =
        format_description::parse("[weekday repr:short], [day] [month repr:short] [year]")?;
    let work = work.format(&format)?;
    println!("You start your career in {company} at: {}", work);

    let age = parse_duration(format!("{}", age).as_ref())?;
    println!("It has been: {}", format_duration(age));

    Ok(())
}
