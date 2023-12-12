using System;
using System.IO;

class _ {
    public static void Main() {
        string[] digits = {"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"};
        string input = File.ReadAllText("input");

        int sum = 0;
        bool seenFirst = false;
        int first = 0;
        int last = 0;
        for (int i = 0; i < input.Length; ++i) {
            int ch = input[i];
            if (ch >= 48 && ch <= 57) { // is digit?
                int n = ch - 48;
                if (!seenFirst) {
                    first = n;
                    seenFirst = true;
                }
                last = n;
            } else if (ch >= 97 && ch <= 122) { // is lowercase alpha?
                // todo lookup which digit strings to compare against
                for (int j = 0; j < digits.Length; ++j) { // is digit?
                    string digit = digits[j];
                    bool isMatch = true;
                    for (int k = 0; k < digit.Length; ++k) {
                        int srcCh = input[i + k];
                        int cmpCh = digit[k];
                        if (srcCh != cmpCh) {
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

            } else if (ch == 10) { // is LF?
                sum += (first * 10) + last; // input line always ends in LF
                seenFirst = false;
                first = 0;
                last = 0;
            }
        }

        Console.Write(sum + "\n");
    }
}