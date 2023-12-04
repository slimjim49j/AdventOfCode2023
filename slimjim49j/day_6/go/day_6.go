package main

import (
    "fmt"
    "os"
)

func check(e error) {
    if e != nil {
        panic(e)
    }
}

func main() {
    dat, err := os.ReadFile("/tmp/dat")
    check(err)
    fmt.Print(string(dat))
}
