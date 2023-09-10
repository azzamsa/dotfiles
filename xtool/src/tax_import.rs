/// Rerefence:
/// `<https://bcsurakarta.beacukai.go.id/artikel/cara-menghitung-bea-masuk-dan-pajak-dalam-rangka-impor-barang-kiriman-dari-luar-negeri/>`
use std::io;

use num_format::{Buffer, Locale};

const BEA_MASUK_RATE: f64 = 0.075; // 7.5%
const PPN_RATE: f64 = 0.1; // 10%

pub(crate) fn run() -> anyhow::Result<()> {
    let cost = read_input("Harga barang (USD) e.g `35.19`")?;
    let insurance = read_input("Asuransi barang (USD) e.g `0.0`")?;
    let freight = read_input("Ongkos kirim (USD) e.g `29.17`")?;
    let exchange_rate = read_input("Kurs USD <=> IDR (IDR) `14000.0`")?;

    let nilai_pabean = hitung_nilai_pabean(cost, insurance, freight, exchange_rate);
    println!("Nilai Pabean: Rp {}", format_number(nilai_pabean));

    let bea_masuk = hitung_bea_masuk(nilai_pabean);
    println!("Bea Masuk: Rp {}", format_number(bea_masuk));

    let ppn = hitung_ppn(nilai_pabean, bea_masuk);
    println!("PPN: Rp {}", format_number(ppn));

    let total_pungutan = bea_masuk + ppn;
    println!("Total Pungutan: Rp {}", format_number(total_pungutan));

    Ok(())
}

/// Nilai Pabean = (Cost + Insurance + Freigt) X Kurs
/// Freigt is a shipping cost
fn hitung_nilai_pabean(cost: f64, insurance: f64, freight: f64, exchange_rate: f64) -> f64 {
    // let cost = 35.19; // USD
    // let insurance = 0.0; // USD
    // let freight = 29.17; // USD
    // let exchange_rate = 14_374.0; // IDR

    let cif = cost + insurance + freight;
    cif * exchange_rate
}

/// BM = 7,5 % X Nilai Pabean
fn hitung_bea_masuk(nilai_pabean: f64) -> f64 {
    BEA_MASUK_RATE * nilai_pabean
}

/// PPN = 10% X Nilai Impor
fn hitung_ppn(nilai_pabean: f64, bea_masuk: f64) -> f64 {
    let nilai_impor = nilai_pabean + bea_masuk;
    PPN_RATE * nilai_impor
}

/// Represent currency in local format
fn format_number(number: f64) -> String {
    let number = number as i64;

    let mut buf = Buffer::default();
    buf.write_formatted(&number, &Locale::en);
    buf.as_str().to_string()
}

fn read_input(message: &str) -> anyhow::Result<f64> {
    let mut input = String::new();
    println!("{message}:");

    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read line");

    let number: Result<f64, _> = input.trim().parse();

    match number {
        Ok(number) => Ok(number),
        Err(_) => {
            anyhow::bail!("Invalid input. Please enter a valid floating-point number.".to_string())
        }
    }
}

// Test module
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn example() {
        let cost = 35.19; // USD
        let insurance = 0.0; // USD
        let freight = 29.17; // USD
        let exchange_rate = 14_374.0; // IDR

        let nilai_pabean = hitung_nilai_pabean(cost, insurance, freight, exchange_rate);
        assert_eq!(nilai_pabean, 925_110.64);

        let bea_masuk = hitung_bea_masuk(nilai_pabean);
        assert_eq!(bea_masuk, 69_383.298);

        let ppn = hitung_ppn(nilai_pabean, bea_masuk);
        assert_eq!(ppn, 99_449.393_8);

        let total_pungutan = bea_masuk + ppn;
        assert_eq!(total_pungutan, 168_832.691_8);
    }
}
