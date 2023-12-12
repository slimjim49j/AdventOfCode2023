@REM build all rust files:
@REM build_rust
@REM build one day:
@REM build_rust 3

@echo off

if "%~1"=="" (
    set "start=1"
    set "end=25"
) else (
    set "start=%1"
    set "end=%1"
)

for /L %%A in (%start%,1,%end%) do (
    pushd "day_%%A/rust"
    if exist "day_%%A.rs" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo building day_%%A.rs
        rustc "..\day_%%A.rs"
        popd
    )
    popd
)
