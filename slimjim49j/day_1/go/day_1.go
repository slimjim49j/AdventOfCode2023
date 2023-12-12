package main

import (
	"fmt"
	"os"
)

var digits = [10]string{"zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	input, err := os.ReadFile("input")
	check(err)

	sum := 0
	seenFirst := false
	first := 0
	last := 0

	for i := 0; i < len(input); i++ {
		ch := input[i]
		if ch >= 48 && ch <= 57 {
			n := ch - 48
			if !seenFirst {
				first = int(n)
				seenFirst = true
			}
			last = int(n)
		} else if ch >= 97 && ch <= 122 {
			for j := 0; j < len(digits); j++ {
				digit := digits[j]
				isMatch := true
				for k := 0; k < len(digit); k++ {
					srcCh := input[i+k]
					cmpCh := digit[k]
					if srcCh != cmpCh {
						isMatch = false
						break
					}
				}
				if isMatch {
					if !seenFirst {
						first = j
						seenFirst = true
					}
					last = j
					break
				}
			}
		} else if ch == 10 {
			sum += (first * 10) + last
			seenFirst = false
			first = 0
			last = 0
		}
	}

	fmt.Printf("%d\n", sum)
}
