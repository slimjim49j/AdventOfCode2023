@echo off

for /L %%A in (1,1,25) do (
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
