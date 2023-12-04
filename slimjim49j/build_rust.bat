@echo off

for /L %%A in (1,1,25) do (
    pushd "day_%%A/rust"
    if exist "day_%%A.rs" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.rs"
        rustc "..\day_%%A.rs"
        popd
    )
    popd
)
