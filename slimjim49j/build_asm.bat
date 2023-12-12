@REM build all asm files:
@REM build_asm
@REM build one day:
@REM build_asm 3

@echo off

if "%~1"=="" (
    set "start=1"
    set "end=25"
) else (
    set "start=%1"
    set "end=%1"
)

@REM get cl
WHERE cl
IF %ERRORLEVEL% NEQ 0 (
    echo running vcvarsall.bat
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
)

for /L %%A in (%start%,1,%end%) do (
    pushd "day_%%A/asm"
    if exist "day_%%A.asm" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.asm"
        nasm -f win64 -o "day_%%A.obj" "..\day_%%A.asm"
        link day_%%A.obj /subsystem:console /out:day_%%A.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
        popd
    )
    popd
)
