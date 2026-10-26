@echo off
setlocal
cd /d "%~dp0"

rem Extra Bases ROM build — zmac v1.3; no Python.
if defined ZMAC (
    set "ZMAC_BIN=%ZMAC%"
) else if exist "tools\zmac.exe" (
    set "ZMAC_BIN=tools\zmac.exe"
) else (
    set "ZMAC_BIN=zmac"
)
where "%ZMAC_BIN%" >nul 2>&1
if errorlevel 1 if not exist "%ZMAC_BIN%" (
    echo ERROR: zmac v1.3 not found. Set ZMAC or install tools\zmac.exe.
    exit /b 1
)
if not exist "src\eb_disassembly.asm" (
    echo ERROR: Missing src\eb_disassembly.asm
    exit /b 1
)

echo Extra Bases ROM build
echo [1/4] Prepare output
if not exist "src\zout" mkdir "src\zout"
if not exist "roms" mkdir "roms"
del /q "src\zout\eb_disassembly.cim" "src\zout\eb_disassembly.lst" "roms\ebases.zip" >nul 2>&1
for %%F in (m761a m761b m761c m761d) do if exist "roms\%%F" del /q "roms\%%F"

echo [2/4] Assemble Z80 source (zmac v1.3)
"%ZMAC_BIN%" -o "src\zout\eb_disassembly.cim" -x "src\zout\eb_disassembly.lst" "src\eb_disassembly.asm"
if errorlevel 1 (
    echo ERROR: Assembly failed.
    exit /b 1
)
if not exist "src\zout\eb_disassembly.cim" (
    echo ERROR: No binary image produced.
    exit /b 1
)

echo [3/4] Split and verify 4 KB ROMs
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference='Stop';" ^
    "$bytes=[IO.File]::ReadAllBytes('src\zout\eb_disassembly.cim');" ^
    "if($bytes.Length -lt 16384){throw 'Binary image must contain at least 16384 bytes'};" ^
    "$names=@('m761a','m761b','m761c','m761d');" ^
    "$sha=@('6483ca1359b675b0dd739605db2a1dbd4b7fb8cb','52e571e671fa61b0f9ab397a5947094c24f6c388','e41fb9db919039c8a48b4caebf80821a066d7ccf','e60c3f4b075f8b811ff6a8637c4aa0b089847a82');" ^
    "for($i=0;$i -lt 4;$i++){ $part=[byte[]]::new(4096);[Array]::Copy($bytes,$i*4096,$part,0,4096);$file=Join-Path 'roms' $names[$i];[IO.File]::WriteAllBytes($file,$part);$actual=(Get-FileHash $file -Algorithm SHA1).Hash.ToLowerInvariant();if($actual -ne $sha[$i]){throw ($names[$i]+' SHA1 mismatch: '+$actual)};Write-Host ($names[$i]+' OK '+$actual) }"
if errorlevel 1 (
    echo ERROR: ROM splitting or verification failed.
    exit /b 1
)

echo [4/4] Package roms\ebases.zip
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference='Stop';" ^
    "Compress-Archive -LiteralPath @('roms\m761a','roms\m761b','roms\m761c','roms\m761d') -DestinationPath 'roms\ebases.zip' -Force"
if errorlevel 1 (
    echo ERROR: ZIP packaging failed.
    exit /b 1
)
if not exist "roms\ebases.zip" (
    echo ERROR: ROM ZIP was not created.
    exit /b 1
)
echo Build complete: roms\ebases.zip
exit /b 0
