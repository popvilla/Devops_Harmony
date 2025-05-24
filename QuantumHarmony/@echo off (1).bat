@echo off
setlocal EnableDelayedExpansion
title Codex Dojo Setup - MyBrainsHouse

echo.
echo === Step 1: Verifying Environment ===

:: Node
echo.
where node >nul 2>nul && (
    for /f "delims=" %%v in ('node -v') do echo Node version: %%v
) || echo [ERROR] Node not installed

:: npm
where npm >nul 2>nul && (
    for /f "delims=" %%v in ('npm -v') do echo npm version: %%v
) || echo ERROR: npm not installed

:: git
where git >nul 2>nul && (
    for /f "delims=" %%v in ('git --version') do echo Git version: %%v
) || echo [ERROR] Git not installed

:: Check or prompt for API Key
echo.
if "%OPENAI_API_KEY%"=="" (
    :EnterApiKey
    set /p "OPENAI_API_KEY=Enter your OpenAI API key (sk-...): "
    if "%OPENAI_API_KEY%"=="" (
        echo [ERROR] API key cannot be empty. Please try again.
        goto EnterApiKey
    )
)

echo.
echo ✅ Environment check complete.

echo.
echo === Step 2: Generating .env and Project Structure ===

mkdir "%CODEXDIR%" 2>nul
if errorlevel 1 (
    echo ❌ Failed to create directory: %CODEXDIR%
    exit /b 1
)
set ROOTDIR=%~dp0Codex_Experiments\AgentZero
set CODEXDIR=%ROOTDIR%\.codex
:: Write .env
if not "%OPENAI_API_KEY%"=="" (
    (
    echo OPENAI_API_KEY=%OPENAI_API_KEY%
    ) > "%ROOTDIR%\.env"
) else (
    echo [ERROR] OPENAI_API_KEY is not set. Skipping .env creation.
)
:: Write .env
:: Prompt for model name
set /p "MODEL_NAME=Enter the model name (default: o4-mini): "
if "%MODEL_NAME%"=="" set "MODEL_NAME=o4-mini"

:: Write config.yaml
(
echo model: %MODEL_NAME%
echo approvalMode: ask-user
echo notify: true
echo fullAutoErrorMode: ignore-and-continue
) > "%CODEXDIR%\config.yaml"
echo approvalMode: ask-user
echo notify: true
echo fullAutoErrorMode: ignore-and-continue
) > "%CODEXDIR%\config.yaml"

:: Write instructions.md
(
echo - Always respond with dry humor and structured commentary
echo - Avoid making filesystem edits unless explicitly told
echo - Format diffs clearly with `---` and `+++` indicators
echo - Do not run `git` commands unless approval mode is full-auto
echo - Summarize each code generation with a one-line rationale
) > "%CODEXDIR%\instructions.md"

:: Write README.md
(
echo # Codex Agent Zero
echo This project tests OpenAI Codex CLI in a controlled AI-enabled environment.
echo.
echo It uses:
echo - Local `.env` secrets
echo - Scoped behavior via `.codex/instructions.md`
echo - Reflective prompt logs
echo.
:: Touch starter_prompt.txt
type nul > "%ROOTDIR%\starter_prompt.txt"
if errorlevel 1 (
    echo ❌ Failed to create starter_prompt.txt in: %ROOTDIR%
    exit /b 1
)
) > "%ROOTDIR%\README.md"

:: Touch starter_prompt.txt
type nul > "%ROOTDIR%\starter_prompt.txt"
if not "%NOPAUSE%"=="1" pause
echo.
echo ✅ Setup complete! Your dojo lives at: %ROOTDIR%
echo.
pause