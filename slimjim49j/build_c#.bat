@REM build all c# files:
@REM build_c#
@REM build one day:
@REM build_c# 3

@echo off

if "%~1"=="" (
    set "start=1"
    set "end=25"
) else (
    set "start=%1"
    set "end=%1"
)

for /L %%A in (%start%,1,%end%) do (
    pushd "day_%%A/c#"
    if exist "day_%%A.cs" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.cs"
        "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\Roslyn\csc.exe" "..\day_%%A.cs"
        popd
    )
    popd
)
