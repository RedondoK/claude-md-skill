@echo off
REM Test Suite Execution Script for Windows
REM Version: 1.0.0
REM Purpose: Run all markdown validation tests and generate results

setlocal enabledelayedexpansion

echo ========================================
echo GFM Skill Test Suite
echo Date: %date% %time%
echo ========================================
echo.

REM Check if markdownlint is installed
where markdownlint >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: markdownlint not found
    echo Install with: npm install -g markdownlint-cli
    exit /b 1
)

REM Get markdownlint version
for /f "tokens=*" %%a in ('markdownlint --version') do set MDLINT_VERSION=%%a
echo markdownlint version: %MDLINT_VERSION%
echo.

REM Initialize counters
set TOTAL_TESTS=0
set PASSED_TESTS=0
set FAILED_TESTS=0
set FLAWED_PASS=0
set FLAWED_FAIL=0
set PERFECT_PASS=0
set PERFECT_FAIL=0

REM Results directory
set RESULTS_DIR=tests\validation\results
if not exist "%RESULTS_DIR%" mkdir "%RESULTS_DIR%"

REM Create timestamp
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set TIMESTAMP=%dt:~0,8%_%dt:~8,6%

set RESULTS_FILE=%RESULTS_DIR%\test-run-%TIMESTAMP%.txt

REM Start results file
echo TEST RUN: %date% %time% > "%RESULTS_FILE%"
echo MARKDOWNLINT VERSION: %MDLINT_VERSION% >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"
echo ======================================== >> "%RESULTS_FILE%"
echo FLAWED DOCUMENTS (Should Have Violations) >> "%RESULTS_FILE%"
echo ======================================== >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"

REM Test flawed documents
echo Testing Flawed Documents (should have violations)...
echo ------------------------------------------------------

for %%f in (tests\flawed\*.md) do (
    set /a TOTAL_TESTS+=1
    
    REM Run markdownlint
    markdownlint "%%f" >nul 2>&1
    
    if !ERRORLEVEL! EQU 0 (
        echo [FAIL] %%~nxf - expected violations, got none
        set /a FAILED_TESTS+=1
        set /a FLAWED_FAIL+=1
        echo FAIL: %%~nxf >> "%RESULTS_FILE%"
        echo Expected: Violations >> "%RESULTS_FILE%"
        echo Got: No violations >> "%RESULTS_FILE%"
        echo. >> "%RESULTS_FILE%"
    ) else (
        echo [PASS] %%~nxf - has violations as expected
        set /a PASSED_TESTS+=1
        set /a FLAWED_PASS+=1
        echo PASS: %%~nxf >> "%RESULTS_FILE%"
        echo Violations found: >> "%RESULTS_FILE%"
        markdownlint "%%f" >> "%RESULTS_FILE%" 2>&1
        echo. >> "%RESULTS_FILE%"
    )
)

echo.

REM Test perfect documents
echo ======================================== >> "%RESULTS_FILE%"
echo PERFECT DOCUMENTS (Should Have No Violations) >> "%RESULTS_FILE%"
echo ======================================== >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"

echo Testing Perfect Documents (should have no violations)...
echo ---------------------------------------------------------

for %%f in (tests\perfect\*.md) do (
    set /a TOTAL_TESTS+=1
    
    REM Run markdownlint
    markdownlint "%%f" >nul 2>&1
    
    if !ERRORLEVEL! EQU 0 (
        echo [PASS] %%~nxf - no violations
        set /a PASSED_TESTS+=1
        set /a PERFECT_PASS+=1
        echo PASS: %%~nxf >> "%RESULTS_FILE%"
        echo No violations found >> "%RESULTS_FILE%"
        echo. >> "%RESULTS_FILE%"
    ) else (
        echo [FAIL] %%~nxf - has unexpected violations
        set /a FAILED_TESTS+=1
        set /a PERFECT_FAIL+=1
        echo FAIL: %%~nxf >> "%RESULTS_FILE%"
        echo Expected: No violations >> "%RESULTS_FILE%"
        echo Got violations: >> "%RESULTS_FILE%"
        markdownlint "%%f" >> "%RESULTS_FILE%" 2>&1
        echo. >> "%RESULTS_FILE%"
    )
)

echo.
echo ========================================
echo TEST SUMMARY
echo ========================================

REM Write summary
echo ======================================== >> "%RESULTS_FILE%"
echo SUMMARY >> "%RESULTS_FILE%"
echo ======================================== >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"
echo FLAWED DOCUMENTS: >> "%RESULTS_FILE%"
echo   Passed: %FLAWED_PASS% (correctly detected violations) >> "%RESULTS_FILE%"
echo   Failed: %FLAWED_FAIL% (missed violations) >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"
echo PERFECT DOCUMENTS: >> "%RESULTS_FILE%"
echo   Passed: %PERFECT_PASS% (correctly clean) >> "%RESULTS_FILE%"
echo   Failed: %PERFECT_FAIL% (false positives) >> "%RESULTS_FILE%"
echo. >> "%RESULTS_FILE%"
echo OVERALL: >> "%RESULTS_FILE%"
echo   Total Tests: %TOTAL_TESTS% >> "%RESULTS_FILE%"
echo   Passed: %PASSED_TESTS% >> "%RESULTS_FILE%"
echo   Failed: %FAILED_TESTS% >> "%RESULTS_FILE%"

echo Flawed Documents: %FLAWED_PASS% passed, %FLAWED_FAIL% failed
echo Perfect Documents: %PERFECT_PASS% passed, %PERFECT_FAIL% failed
echo Total: %PASSED_TESTS%/%TOTAL_TESTS% tests passed

if %FAILED_TESTS% EQU 0 (
    set SUCCESS_RATE=100
    echo Success Rate: 100%%
    echo   Success Rate: 100%% >> "%RESULTS_FILE%"
    echo. >> "%RESULTS_FILE%"
    echo STATUS: ALL TESTS PASSED >> "%RESULTS_FILE%"
) else (
    set /a SUCCESS_RATE=%PASSED_TESTS% * 100 / %TOTAL_TESTS%
    echo Success Rate: !SUCCESS_RATE!%%
    echo   Success Rate: !SUCCESS_RATE!%% >> "%RESULTS_FILE%"
    echo. >> "%RESULTS_FILE%"
    echo STATUS: SOME TESTS FAILED >> "%RESULTS_FILE%"
)

echo.
echo Results saved to: %RESULTS_FILE%
echo.

REM Exit with appropriate code
if %FAILED_TESTS% EQU 0 (
    exit /b 0
) else (
    exit /b 1
)
