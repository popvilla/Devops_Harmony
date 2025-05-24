
@echo off
REM ========================================
REM Quantum Harmony R Package Installer
REM ========================================

echo p& Checking and installing R packages needed for Part 1...
echo.

REM Launch R and run setup script
Rscript "%~dp0setup_R_packages.R"

pause
