use std::time::Instant;

fn nth_prime(mut n: u32) -> u32 {
    let mut i = 3;
    let mut j = 1;
    loop {
        j = j + 2;
        if j * j > i {
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
    let now = Instant::now();
    let result = nth_prime(300000);
    let du = now.elapsed().as_millis();
    println!("答案是:{},耗时:{}ms", result, du);
}