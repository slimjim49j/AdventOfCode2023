use std::fs;

const DIGITS: &[&[u8]; 10] = &[
    "zero".as_bytes(),
    "one".as_bytes(),
    "two".as_bytes(),
    "three".as_bytes(),
    "four".as_bytes(),
    "five".as_bytes(),
    "six".as_bytes(),
    "seven".as_bytes(),
    "eight".as_bytes(),
    "nine".as_bytes(),
];

fn main() {
    let file = fs::read_to_string("./input").unwrap();
    let input = file.as_bytes();

    let mut sum = 0;
    let mut seen_first = false;
    let mut first: usize = 0;
    let mut last: usize = 0;
    for i in 0..input.len() {
        let ch = input[i] as usize;

        if ch >= 48 && ch <= 57 {
            let n: usize = ch - 48;
            if !seen_first {
                first = n;
                seen_first = true;
            }
            last = n;
        } else if ch >= 97 && ch <= 122 {
            for j in 0..DIGITS.len() {
                let digit = DIGITS[j];
                let mut is_match = true;
                for k in 0..digit.len() {
                    let src_ch = input[i + k];
                    let cmp_ch = digit[k];
                    if src_ch != cmp_ch {
                        is_match = false;
                        break;
                    }
                }
                if is_match {
                    if !seen_first {
                        first = j;
                        seen_first = true;
                    }
                    last = j;
                    break;
                }
            }
        } else if ch == 10 {
            sum += (first * 10) + last;
            seen_first = false;
            first = 0;
            last = 0;
        }
    }
    println!("{}", sum);
}
