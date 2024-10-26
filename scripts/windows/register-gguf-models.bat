@echo off
setlocal enabledelayedexpansion

echo Ollama GGUF Model Registration Utility
echo =====================================
echo.

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [31mError: Administrator privileges required![0m
    echo Please run this script as Administrator.
    pause
    exit /b 1
)

REM Set models directory
set "MODELS_DIR=%USERPROFILE%\.ollama\models"

REM Check if Ollama is installed
where ollama >nul 2>&1
if %errorLevel% neq 0 (
    echo [31mError: Ollama not found![0m
    echo Please install Ollama first from: https://ollama.ai
    pause
    exit /b 1
)

REM Check if Ollama models directory exists
if not exist "%MODELS_DIR%" (
    echo [31mError: Ollama models directory not found![0m
    echo Expected location: %MODELS_DIR%
    echo Please install Ollama first.
    pause
    exit /b 1
)

echo Scanning for GGUF models in: %MODELS_DIR%
echo.

REM Count total GGUF files
set "total_models=0"
set "processed_models=0"
set "failed_models=0"

for /r "%MODELS_DIR%" %%F in (*.gguf) do (
    set /a "total_models+=1"
)

if %total_models% equ 0 (
    echo [33mNo GGUF models found![0m
    echo Please place your GGUF files in: %MODELS_DIR%
    pause
    exit /b 1
)

echo Found %total_models% GGUF model(s)
echo.

REM Process each GGUF file
for /r "%MODELS_DIR%" %%F in (*.gguf) do (
    REM Skip temporary/partial downloads
    echo "%%~nxF" | findstr /i ".tmp" >nul
    if errorlevel 1 (
        echo Processing [%processed_models%/%total_models%]: %%~nxF
        
        REM Extract model name from filename
        set "model_name=%%~nF"
        
        REM Create temporary Modelfile
        echo FROM "%%F" > "%%~dpnF.Modelfile"
        
        REM Register model with Ollama
        ollama create "!model_name!" -f "%%~dpnF.Modelfile" >nul 2>&1
        if !errorLevel! equ 0 (
            echo [32m√ Successfully registered: !model_name![0m
            set /a "processed_models+=1"
        ) else (
            echo [31m× Failed to register: !model_name![0m
            set /a "failed_models+=1"
        )
        
        REM Clean up
        del "%%~dpnF.Modelfile" >nul 2>&1
        echo.
    )
)

echo.
echo Registration Summary:
echo [32mSuccessfully registered: %processed_models% model(s)[0m
if %failed_models% gtr 0 (
    echo [31mFailed to register: %failed_models% model(s)[0m
)
echo.
echo Use 'ollama list' to view all registered models.
pause