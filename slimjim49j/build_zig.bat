@echo off

for /L %%A in (1,1,25) do (
    pushd "day_%%A/zig"
    if exist "day_%%A.zig" (
        if not exist "build" (
            mkdir "build"
        )
        pushd "build"
        echo "building day_%%A.zig"
        zig build-exe "..\day_%%A.zig"
        popd
    )
    popd
)
