@echo off
setlocal

cd /d "%~dp0"

:: -----------------------------------------------------------------------------
:: Pre-flight Checks & Dependency Resolution
:: -----------------------------------------------------------------------------

:: Resolve zmac executable path
if defined ZMAC (
    if exist "%ZMAC%" (
        set "ZMAC_BIN=%ZMAC%"
    ) else (
        where "%ZMAC%" >nul 2>&1 && set "ZMAC_BIN=%ZMAC%" || (echo ERROR: ZMAC not found & pause & exit /b 1)
    )
) else if exist "tools\zmac.exe" (
    set "ZMAC_BIN=tools\zmac.exe"
) else (
    where zmac >nul 2>&1 && set "ZMAC_BIN=zmac" || (echo ERROR: zmac not found & pause & exit /b 1)
)

:: -----------------------------------------------------------------------------
:: Build Execution
:: -----------------------------------------------------------------------------

echo Extra Bases ROM build
echo   source: src\eb_disassembly.asm
echo   output: roms
echo.

echo [1/4] Preparing clean build environment...
if exist "src\zout" rmdir /s /q "src\zout"
mkdir "src\zout"
if not exist "roms" mkdir "roms"

echo [2/4] Assembling eb_disassembly.asm
echo       zmac: %ZMAC_BIN%
"%ZMAC_BIN%" -h -o src\zout\eb_disassembly.hex -x src\zout\eb_disassembly.lst src\eb_disassembly.asm
set ZMAC_ERR=%ERRORLEVEL%

if %ZMAC_ERR% neq 0 (
    echo ERROR: zmac failed. Review the assembler output above.
    pause
    exit /b %ZMAC_ERR%
)

echo [3/4] Splitting image into Extra Bases ROMs...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$inputFile = 'src\zout\eb_disassembly.hex';" ^
    "$outputDir = 'roms';" ^
    "if (-not (Test-Path $inputFile)) { Write-Error 'Input HEX file missing.'; exit 1 };" ^
    "$memory = [byte[]]::new(0x4000);" ^
    "for ($i = 0; $i -lt 0x4000; $i++) { $memory[$i] = 0xFF };" ^
    "$hexLines = Get-Content $inputFile;" ^
    "foreach ($line in $hexLines) {" ^
    "    if (-not $line.StartsWith(':')) { continue };" ^
    "    $byteCount = [Convert]::ToByte($line.Substring(1, 2), 16);" ^
    "    $address   = [Convert]::ToUInt16($line.Substring(3, 4), 16);" ^
    "    $recordType= [Convert]::ToByte($line.Substring(7, 2), 16);" ^
    "    if ($recordType -eq 0) {" ^
    "        for ($i = 0; $i -lt $byteCount; $i++) {" ^
    "            $dataByte = [Convert]::ToByte($line.Substring(9 + ($i * 2), 2), 16);" ^
    "            $targetAddr = $address + $i;" ^
    "            if ($targetAddr -lt 0x4000) { $memory[$targetAddr] = $dataByte };" ^
    "        }" ^
    "    }" ^
    "};" ^
    "$romMap = [ordered]@{" ^
    "    'm761a' = 0x0000..0x0FFF;" ^
    "    'm761b' = 0x1000..0x1FFF;" ^
    "    'm761c' = 0x2000..0x2FFF;" ^
    "    'm761d' = 0x3000..0x3FFF;" ^
    "};" ^
    "foreach ($romName in $romMap.Keys) {" ^
    "    $slice = $memory[$romMap[$romName]];" ^
    "    [System.IO.File]::WriteAllBytes((Join-Path $outputDir $romName), $slice);" ^
    "    Write-Host ('  -> Wrote ' + $romName + ' (' + $slice.Length + ' bytes)');" ^
    "}"

if %ERRORLEVEL% neq 0 (
    echo ERROR: ROM splitting failed.
    exit /b 1
)

powershell -NoProfile -Command ^
    "$expected = @{'m761a'='6483ca1359b675b0dd739605db2a1dbd4b7fb8cb'; 'm761b'='52e571e671fa61b0f9ab397a5947094c24f6c388'; 'm761c'='e41fb9db919039c8a48b4caebf80821a066d7ccf'; 'm761d'='e60c3f4b075f8b811ff6a8637c4aa0b089847a82'};" ^
    "foreach ($name in $expected.Keys) { if ((Get-FileHash (Join-Path 'roms' $name) -Algorithm SHA1).Hash.ToLowerInvariant() -ne $expected[$name]) { Write-Error ('ROM checksum mismatch: ' + $name); exit 1 } }"
if %ERRORLEVEL% neq 0 (
    echo ERROR: ROM verification failed.
    exit /b 1
)

echo [4/4] Packaging roms\ebases.zip...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$filesToZip = [System.Collections.Generic.List[string]]::new();" ^
    "@('m761a', 'm761b', 'm761c', 'm761d') | ForEach-Object { $filesToZip.Add((Join-Path 'roms' $_)) };" ^
    "Compress-Archive -Path $filesToZip -DestinationPath 'roms\ebases.zip' -Force"

if %ERRORLEVEL% neq 0 (
    echo ERROR: Packaging failed.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo =======================================================================
echo  BUILD SUCCESSFUL!
echo =======================================================================
pause