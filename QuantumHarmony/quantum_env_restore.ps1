
# ================================
# Quantum Harmony Environment Restore
# ================================
Write-Host "🔁 Restoring Quantum Harmony environment..."

# Set the base path
$projectRoot = "$HOME\Documents\QuantumHarmony"

# Check and confirm directory exists
if (!(Test-Path $projectRoot)) {
    Write-Host "❌ Project directory not found: $projectRoot"
    return
}

# Change into the project folder
Set-Location -Path $projectRoot
Write-Host "📂 Changed directory to: $projectRoot"

# Set environment variable
$env:PROJECT_DIR = $projectRoot
Write-Host "🌐 PROJECT_DIR set to: $env:PROJECT_DIR"

# Confirm contents
Write-Host "📄 Files in project folder:"
Get-ChildItem
