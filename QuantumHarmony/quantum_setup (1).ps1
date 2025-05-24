# ============================

# Quantum Harmony Setup Script

============================

Write-Host "🔄 Initializing Quantum Harmony project environment..."

# Step 1: Define your default project folder

$defaultPath = "$HOME\Documents\QuantumHarmony"

# Step 2: Create the folder if it doesn't exist

if (!(Test-Path \$defaultPath)) { Write-Host "📁 Creating project directory at: \$defaultPath" New-Item -ItemType Directory -Path \$defaultPath \| Out-Null } else { Write-Host "✅ Project folder already exists." }

# Step 3: Set environment variable for this session

\$env:PROJECT_DIR = \$defaultPath Write-Host "\`n🌐 PROJECT_DIR set to: \$env:PROJECT_DIR"

# Step 4: Confirm file structure

Write-Host "\`n📂 Files in project folder:" Get-ChildItem -Path \$env:PROJECT_DIR

# Step 5: Optional - copy bundled data files (if provided elsewhere)

# For demonstration: placeholder logic

$bundlePath = "$PSScriptRoot\project\_bundle" if (Test-Path $bundlePath) {
    Copy-Item "$bundlePath\*" -Destination \$env:PROJECT_DIR -Recurse -Force Write-Host "\`n📦 Files copied from bundle to project folder." }

# Step 6: Print instructions

Write-Host "\`n✅ Quantum Harmony setup complete." Write-Host "Next time, run this script to automatically set your PROJECT_DIR." Write-Host "This allows R, Python, and Power BI to access your project path securely."

# Directory tip

Write-Host "`n🧠 Directory Tips:" Write-Host "  - Use $env:PROJECT_DIR in PowerShell to refer to your project path" Write-Host "  - Use Sys.getenv("PROJECT_DIR") in R" Write-Host "  - Use os.getenv("PROJECT_DIR") in Python" Write-Host "`nHappy exploring ⚛️"

# SIG \# Begin signature block

# MIIFhQYJKoZIhvcNAQcCoIIFdjCCBXICAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB

# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR

# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUQkGT2+ReJDWgF2fCZ7BwpaBr

# CfygggMhMIIDHTCCAgWgAwIBAgIQYpafTqA/2p1ABqkFYjzElDANBgkqhkiG9w0B

# AQsFADAZMRcwFQYDVQQDDA5RdWFudHVtSGFybW9ueTAeFw0yNTAzMjgyMzA0NTFa

# Fw0yNjAzMjgyMzI0NTFaMBkxFzAVBgNVBAMMDlF1YW50dW1IYXJtb255MIIBIjAN

# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtli2eQmRAUcuaZWFSGvFDizhUVXz

# ZnmhJBKcSdIdf2hedcEvz0VjkW7gc4YaoHBOOqXpOJn8Wmq17qg3Ca8PW5bZ1FUb

# F7EymQu4v+SIp8Wu1nenOOfOUG5UAsii+5of12GZOtCTXSpwIX9FQ1pfbxGiBiXN

# 1FsVcLK9W1GSlou5z33DQdJJc6Aqm7nS//bD5oFCDm7A6zIn/gd10YFireorSfLX

# JTinJS5LaPdZF1Ef4Z/+pPUN1gfsr2fNPVkYQupSqYbtBZRn49snEC4P4ZmqYYcU

# LmRgeQUYqOFsprCzusMP5AlzLUYJC06a8SljQf7tuD/jFjfrqbA2eca2UQIDAQAB

# o2EwXzAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwGQYDVR0R

# BBIwEIIOUXVhbnR1bUhhcm1vbnkwHQYDVR0OBBYEFPIVr1u2yxWDd0J94CGG9s/9

# X4joMA0GCSqGSIb3DQEBCwUAA4IBAQAepacgJwfsHz20HORO4HmryKbUvv4CXNof

# SzQM2FdmtVxdXXi4/RP925lqvtb2GqFV+mOjK1HC+g5y/U/4LgxOdaZ2HiMQcv4D

# cLR7Do2r4mLMNVRIYn+qdberal4GJIbGsGA02IR/iPbo+jqCHSzyF0N3DEsnX+ZY

# Nkcwtv3rKgomUaSkhUmLuefkEw3wpfDA+i7duOjGLV0/zM9vSuNBaapkd2bkB9NW

# tNuqV3dSFgHfhjWMwWxPXtv0QOBevo9iYtKrJa3iZQFAFeMjQfmuL4U3nZJgkhPh

# 3qDEKc5tH4CSSKsbb4vfmmB8Yhaxv1ugOQLJgZNHBWcb88vt7micMYIBzjCCAcoC

# AQEwLTAZMRcwFQYDVQQDDA5RdWFudHVtSGFybW9ueQIQYpafTqA/2p1ABqkFYjzE

# lDAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG

# 9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIB

# FTAjBgkqhkiG9w0BCQQxFgQUOLho1MQTW7oHxH4DkoLudGt+qq0wDQYJKoZIhvcN

# AQEBBQAEggEAI1lKgeWwPuawE/m3Bn+/GbnmV6QPRglfImpAyeefI9gpXjB5wRAg

# RkFQkaBBZ10thjpUV15P9JSOG4mUer86IRbmtnXz5nM+cuay/ka2vEdAxVYLePDB

# xjKd70rGyshCiluekxkuERAbHwfAur7wfv2h360PGVRjfaILn8/CfQWe1km7Pvkj

# 3RSlZwIh3xltTgAHL1H/7VOUHsTekLvULtgt1/6SsWF7rttbd++w9WoDDXz15wXq

# 1x5p3A+lQysrqeSKVbd+h7IukaAw0lJdEzqHvC0vlqrk55cOryn0EZpj8LpinVv3

# vYZJYtoliM0pCNWHIOyFTCkj2rscF/acow==

# SIG \# End signature block
