@echo off

@REM get cl
WHERE cl
IF %ERRORLEVEL% NEQ 0 (
    echo running vcvarsall.bat
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x64
)

for /L %%A in (1,1,25) do (
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
