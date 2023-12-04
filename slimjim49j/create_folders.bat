@ECHO OFF

for /L %%A in (1,1,25) do (
    if exist "day_%%A" (
        echo deleting day_%%A
        rmdir /S /Q "day_%%A"
    )
    mkdir "day_%%A"
    xcopy /E "template" "day_%%A"

    pushd "day_%%A/asm"
    ren "template.asm" "day_%%A.asm"
    popd

    pushd "day_%%A/c"
    ren "template.cpp" "day_%%A.cpp"
    popd

    pushd "day_%%A/c#"
    ren "template.cs" "day_%%A.cs"
    popd

    pushd "day_%%A/go"
    ren "template.go" "day_%%A.go"
    popd

    pushd "day_%%A/rust"
    ren "template.rs" "day_%%A.rs"
    popd

    pushd "day_%%A/typescript"
    ren "template.ts" "day_%%A.ts"
    popd

    pushd "day_%%A/zig"
    ren "template.zig" "day_%%A.zig"
    popd
)
