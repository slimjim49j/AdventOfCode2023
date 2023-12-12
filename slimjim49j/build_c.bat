@REM build all c files:
@REM build_c
@REM build one day:
@REM build_c 3

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
    pushd "day_%%A/c"
    if exist "day_%%A.cpp" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.cpp"
        cl -FC -Zi "..\day_%%A.cpp"
        popd
    )
    popd
)
