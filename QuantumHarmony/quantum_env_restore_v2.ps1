
# ================================
# Quantum Harmony Environment Restore v2
# ================================

# 💡 Index System: Each line prints a [Step #] to confirm granular progress
# 🔁 Re-running this script is safe: it checks each folder before creating
# 🧠 Concept: This script sets the working directory + $env:PROJECT_DIR for safe, repeatable access

# ----- Step 1: Define base path (home safe) -----
$step = 1
$projectRoot = "$HOME\Documents\QuantumHarmony"
Write-Host "[$step] 📍 Project root set to: $projectRoot"
$step++

# ----- Step 2: Check project folder exists -----
if (!(Test-Path $projectRoot)) {
    Write-Host "[$step] ❌ Project folder not found. Creating it now..."
    New-Item -ItemType Directory -Path $projectRoot | Out-Null
} else {
    Write-Host "[$step] ✅ Project folder exists."
}
$step++

# ----- Step 3: Set environment variable -----
$env:PROJECT_DIR = $projectRoot
Write-Host "[$step] 🌐 Environment variable PROJECT_DIR set."
$step++

# ----- Step 4: Change into project directory -----
Set-Location -Path $projectRoot
Write-Host "[$step] 📂 Now working in: $PWD"
$step++

# ----- Step 5: Define folders for modular workflow -----
$folders = @("data", "outputs", "scripts", "notebooks", "models")
foreach ($folder in $folders) {
    $path = Join-Path -Path $env:PROJECT_DIR -ChildPath $folder
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
        Write-Host "[$step] 🆕 Created subfolder: $folder"
    } else {
        Write-Host "[$step] 🔁 Subfolder already exists: $folder"
    }
    $step++
}

# ----- Step 6: Optional - show current state of project folder -----
Write-Host "[$step] 📄 Directory contents:"
Get-ChildItem -Path $env:PROJECT_DIR
$step++

# ----- Step 7: (Future) Detect and auto-sort tagged files -----
# 🧠 Not active yet — tagging logic would parse filenames like [data]_sales.xlsx
# Would move to corresponding subfolder
Write-Host "[$step] 🚧 File tagging and routing logic reserved for v3."
$step++

# ----- Step 8: Log summary (optional) -----
# 🔐 Output could be logged to a file here for audit/debug
# Example:
# Add-Content -Path "$env:PROJECT_DIR\restore_log.txt" -Value "$(Get-Date) Restore completed to $env:PROJECT_DIR"

Write-Host "[$step] ✅ Environment restore complete."
