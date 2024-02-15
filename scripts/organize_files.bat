@echo off
setlocal enabledelayedexpansion

set "directory=%~1"
REM set "directory=(Enter your path to run this script)"
REM example,
REM set "directory=C:\Users\navin\Downloads\New folder"

REM Iterate over files in the directory
for %%i in ("%directory%\*") do (
    REM Check if it's a file
    if exist "%%i" (
        REM Get the file extension
        for /f "tokens=*" %%j in ("%%~xi") do (
            set "file_extension=%%j"
            REM Remove leading dots from file extension
            set "file_extension=!file_extension:~1!"
            echo "Processing file: %%i, Extension: !file_extension!"
            REM Create directory if not exists
            mkdir "%directory%\!file_extension!" 2>nul
            REM Move the file to the corresponding directory
            move "%%i" "%directory%\!file_extension!" >nul
        )
    )
)

echo Files organized successfully in %directory%

:end