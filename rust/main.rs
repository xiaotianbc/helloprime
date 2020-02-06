use chrono::prelude::*;

fn nth_prime(mut n: u32) -> u32 {
    let mut i = 3;
    let mut j = 1;
    loop {
        j = j + 2;
        if j > i / j {
            n = n - 1;
            if n == 1 {
                break;
            }
            i = i + 2;
            j = 1;
        } else if i % j == 0 {
            i = i + 2;
            j = 1;
        }
    }
    return i;
}

fn main() {
    let n = 300000;
    let st: DateTime<Local> = Local::now();
    let result = nth_prime(n);
    let et: DateTime<Local> = Local::now();
    let du = (et - st).num_milliseconds();
    println!("答案是:{},耗时:{}ms", result, du);
}