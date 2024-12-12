use rand::Rng;

pub fn get_random_number(length: usize) -> usize {
    let mut rng = rand::thread_rng();
    rng.gen_range(0..length)
}
