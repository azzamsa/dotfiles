use rand::Rng;
use std::io::{self, Write};

pub fn get_random_number(length: usize) -> usize {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..length)
}

pub fn stdout(input: &str) {
    writeln!(io::stdout(), "{input}").ok();
}
