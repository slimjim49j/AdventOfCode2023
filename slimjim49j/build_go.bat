@REM build all go files:
@REM build_go
@REM build one day:
@REM build_go 3

@echo off

if "%~1"=="" (
    set "start=1"
    set "end=25"
) else (
    set "start=%1"
    set "end=%1"
)

for /L %%A in (%start%,1,%end%) do (
    pushd "day_%%A/go"
    if exist "day_%%A.go" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.go"
        go build "..\day_%%A.go"
        popd
    )
    popd
)
