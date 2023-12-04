@echo off

for /L %%A in (1,1,25) do (
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
