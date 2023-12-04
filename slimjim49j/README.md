# Advent of Code 2023

## Build

This was project was done on windows.

There are build .bat files to create builds for every language except for the typescript solutions.

See deps for each language below:

### ASM, C, C#

These all depend on the MS Build Tools.

ASM also depends on NASM.

You may need to edit the respective build .bat files to the exact path of the compiler / vcvarsall.bat file.

### Go

go version go1.21.4 windows/amd64

### Rust

rustc 1.74.0 (79e9716c9 2023-11-13)

### Typescript

I have used the deno runtime to execute javascript on windows.

### Zig

zig release 2023-12-01
