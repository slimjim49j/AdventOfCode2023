@echo off

if "%~1"=="" (
    echo Please specify language.
    goto :eof
) else (
    set "lang=%1"
)

if "%~2"=="" (
    echo Please specify day.
    goto :eof
) else (
    set "day=%2"
)

call build_%lang%.bat %day%

pushd day_%day%\data

echo Running %lang% Day %day% Build:
"..\%lang%\build\day_%day%.exe"

popd

:eof