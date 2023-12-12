import { readFileSync } from "node:fs";

const digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
const input: string = readFileSync("input", { encoding: "utf8" });

let sum = 0;
let seenFirst = false;
let first = 0;
let last = 0;
for (let i = 0; i < input.length; ++i) {
    const ch = input.charCodeAt(i);
    if (ch >= 48 && ch <= 57) { // is digit?
        const n = ch - 48;
        if (!seenFirst) {
            first = n;
            seenFirst = true;
        }
        last = n;
    } else if (ch >= 97 && ch <= 122) { // is lowercase alpha?
        // todo lookup which digit strings to compare against
        for (let j = 0; j < digits.length; ++j) { // is digit?
            const digit = digits[j];
            let isMatch = true;
            for (let k = 0; k < digit.length; ++k) {
                const srcCh = input[i + k];
                const cmpCh = digit[k];
                if (srcCh !== cmpCh) {
                    isMatch = false;
                    break;
                }
            }
            if (isMatch) {
                if (!seenFirst) {
                    first = j;
                    seenFirst = true;
                }
                last = j;
                break;
            }
        }

    } else if (ch === 10) { // is LF?
        sum += (first * 10) + last; // input line always ends in LF
        seenFirst = false;
        first = 0;
        last = 0;
    }
}

console.log(sum);
