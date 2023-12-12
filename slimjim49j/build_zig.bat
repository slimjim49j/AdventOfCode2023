@REM build all zig files:
@REM build_zig
@REM build one day:
@REM build_zig 3

@echo off

if "%~1"=="" (
    set "start=1"
    set "end=25"
) else (
    set "start=%1"
    set "end=%1"
)

for /L %%A in (%start%,1,%end%) do (
    pushd "day_%%A/zig"
    if exist "day_%%A.zig" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo building day_%%A.zig
        zig build-exe "..\day_%%A.zig"
        popd
    )
    popd
)
