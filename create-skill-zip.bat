@echo off
REM Create ZIP file of markdown skill for Claude upload
REM Run this from the md_skill_md directory

echo Creating markdown.zip...
echo.

cd /d %~dp0

if exist "markdown.zip" (
    echo Removing old ZIP file...
    del /f /q "markdown.zip"
)

if exist "markdown" (
    tar -a -c -f markdown.zip markdown
    
    if %errorlevel% == 0 (
        echo.
        echo SUCCESS: Created markdown.zip
        echo.
        echo File location: %cd%\markdown.zip
        echo.
        echo Next steps:
        echo 1. Go to https://claude.ai/settings/capabilities
        echo 2. Scroll to Skills section
        echo 3. Click 'Upload skill'
        echo 4. Upload markdown.zip
        echo 5. Toggle skill ON
        echo.
        pause
    ) else (
        echo.
        echo ERROR: Failed to create ZIP file
        echo.
        pause
        exit /b 1
    )
) else (
    echo ERROR: markdown/ directory not found
    echo.
    echo Current directory contents:
    dir /b
    echo.
    pause
    exit /b 1
)
