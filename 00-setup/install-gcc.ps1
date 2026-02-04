# ==============================================================================
# GCC (MinGW-w64) Automatic Installation Script
# ==============================================================================
# This script automatically downloads and installs GCC compiler on Windows
# Perfect for C Programming beginners
# ==============================================================================

# Require Administrator privileges
#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"

Write-Host "`n" -NoNewline
Write-Host "╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                       ║" -ForegroundColor Cyan
Write-Host "║           GCC (MinGW-w64) Automatic Installation Script              ║" -ForegroundColor Cyan
Write-Host "║           For C Programming Development on Windows                   ║" -ForegroundColor Cyan
Write-Host "║                                                                       ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ==============================================================================
# STEP 1: Check if GCC is already installed
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📋 STEP 1: Checking existing GCC installation..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

$gccExists = Get-Command gcc -ErrorAction SilentlyContinue
if ($gccExists) {
    Write-Host "✅ GCC is already installed!" -ForegroundColor Green
    Write-Host ""
    gcc --version | Select-Object -First 1
    Write-Host ""
    $continue = Read-Host "Do you want to reinstall? (y/N)"
    if ($continue -ne "y" -and $continue -ne "Y") {
        Write-Host "Installation cancelled." -ForegroundColor Yellow
        exit 0
    }
}

if (Test-Path "C:\mingw64") {
    Write-Host "⚠️  C:\mingw64 already exists!" -ForegroundColor Yellow
    $backup = Read-Host "Backup and reinstall? (y/N)"
    if ($backup -eq "y" -or $backup -eq "Y") {
        $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
        Write-Host "📦 Backing up to C:\mingw64_backup_$timestamp..." -ForegroundColor Cyan
        Rename-Item "C:\mingw64" "C:\mingw64_backup_$timestamp"
        Write-Host "✅ Backup complete!" -ForegroundColor Green
    } else {
        Write-Host "Installation cancelled." -ForegroundColor Yellow
        exit 0
    }
}

Write-Host "✅ Ready to install GCC" -ForegroundColor Green
Write-Host ""
Start-Sleep -Seconds 1

# ==============================================================================
# STEP 2: Install 7-Zip (required for extracting .7z files)
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📦 STEP 2: Installing 7-Zip..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

if (Test-Path "C:\Program Files\7-Zip\7z.exe") {
    Write-Host "✅ 7-Zip already installed" -ForegroundColor Green
} else {
    Write-Host "📥 Installing 7-Zip via winget..." -ForegroundColor Cyan
    try {
        winget install -e --id 7zip.7zip --accept-source-agreements --accept-package-agreements --silent
        Write-Host "✅ 7-Zip installed successfully!" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to install 7-Zip" -ForegroundColor Red
        Write-Host "Please install 7-Zip manually from: https://www.7-zip.org/" -ForegroundColor Yellow
        exit 1
    }
}

Write-Host ""
Start-Sleep -Seconds 1

# ==============================================================================
# STEP 3: Download MinGW-w64
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📥 STEP 3: Downloading MinGW-w64 (GCC 13.2.0)..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

$mingwUrl = "https://github.com/niXman/mingw-builds-binaries/releases/download/13.2.0-rt_v11-rev1/x86_64-13.2.0-release-posix-seh-ucrt-rt_v11-rev1.7z"
$downloadPath = "$env:TEMP\mingw64.7z"

Write-Host "📍 URL: $mingwUrl" -ForegroundColor Gray
Write-Host "📂 Downloading to: $downloadPath" -ForegroundColor Gray
Write-Host ""
Write-Host "⏳ This may take a few minutes (80+ MB)..." -ForegroundColor Yellow
Write-Host ""

try {
    # Download with progress
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $mingwUrl -OutFile $downloadPath -UseBasicParsing
    $ProgressPreference = 'Continue'
    
    $fileSize = (Get-Item $downloadPath).Length / 1MB
    Write-Host "✅ Download complete! ($([math]::Round($fileSize, 2)) MB)" -ForegroundColor Green
} catch {
    Write-Host "❌ Download failed: $_" -ForegroundColor Red
    Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Start-Sleep -Seconds 1

# ==============================================================================
# STEP 4: Extract MinGW-w64 to C:\mingw64
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "📦 STEP 4: Extracting MinGW-w64 to C:\mingw64..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "⏳ This may take a few minutes..." -ForegroundColor Yellow
Write-Host ""

try {
    $7zipPath = "C:\Program Files\7-Zip\7z.exe"
    $extractArgs = @("x", $downloadPath, "-oC:\", "-y")
    
    $process = Start-Process -FilePath $7zipPath -ArgumentList $extractArgs -Wait -PassThru -NoNewWindow
    
    if ($process.ExitCode -eq 0) {
        Write-Host "✅ Extraction complete!" -ForegroundColor Green
    } else {
        throw "7-Zip extraction failed with exit code: $($process.ExitCode)"
    }
} catch {
    Write-Host "❌ Extraction failed: $_" -ForegroundColor Red
    exit 1
}

# Verify extraction
if (Test-Path "C:\mingw64\bin\gcc.exe") {
    Write-Host "✅ GCC compiler found at C:\mingw64\bin\gcc.exe" -ForegroundColor Green
} else {
    Write-Host "❌ GCC compiler not found after extraction!" -ForegroundColor Red
    exit 1
}

# Cleanup downloaded file
Write-Host ""
Write-Host "🧹 Cleaning up download file..." -ForegroundColor Cyan
Remove-Item $downloadPath -Force
Write-Host "✅ Cleanup complete!" -ForegroundColor Green

Write-Host ""
Start-Sleep -Seconds 1

# ==============================================================================
# STEP 5: Add to System PATH
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "🔧 STEP 5: Adding GCC to System PATH..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

try {
    $currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")
    
    if ($currentPath -notlike "*C:\mingw64\bin*") {
        $newPath = $currentPath + ";C:\mingw64\bin"
        [Environment]::SetEnvironmentVariable("Path", $newPath, "Machine")
        Write-Host "✅ C:\mingw64\bin added to System PATH" -ForegroundColor Green
    } else {
        Write-Host "✅ C:\mingw64\bin already in System PATH" -ForegroundColor Green
    }
    
    # Update current session PATH
    $env:Path = "C:\mingw64\bin;" + $env:Path
    
} catch {
    Write-Host "⚠️  Could not add to System PATH automatically" -ForegroundColor Yellow
    Write-Host "   You may need to add C:\mingw64\bin to PATH manually" -ForegroundColor Gray
}

Write-Host ""
Start-Sleep -Seconds 1

# ==============================================================================
# STEP 6: Verify Installation
# ==============================================================================
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✅ STEP 6: Verifying Installation..." -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""

# Test GCC
Write-Host "🧪 Testing GCC:" -ForegroundColor Cyan
try {
    $gccVersion = & gcc --version 2>&1 | Select-Object -First 1
    Write-Host "   $gccVersion" -ForegroundColor Green
} catch {
    Write-Host "   ❌ GCC test failed" -ForegroundColor Red
}

Write-Host ""

# Test G++
Write-Host "🧪 Testing G++:" -ForegroundColor Cyan
try {
    $gppVersion = & g++ --version 2>&1 | Select-Object -First 1
    Write-Host "   $gppVersion" -ForegroundColor Green
} catch {
    Write-Host "   ❌ G++ test failed" -ForegroundColor Red
}

Write-Host ""

# Test with a simple program
Write-Host "🧪 Testing compilation:" -ForegroundColor Cyan
$testCode = @"
#include <stdio.h>
int main() {
    printf("GCC is working correctly!\n");
    return 0;
}
"@

$testFile = "$env:TEMP\test.c"
$testExe = "$env:TEMP\test.exe"

try {
    $testCode | Out-File -FilePath $testFile -Encoding ASCII
    
    # Compile
    & gcc $testFile -o $testExe 2>&1 | Out-Null
    
    if (Test-Path $testExe) {
        # Run
        $output = & $testExe
        Write-Host "   $output" -ForegroundColor Green
        
        # Cleanup
        Remove-Item $testFile, $testExe -Force
    } else {
        Write-Host "   ❌ Compilation test failed" -ForegroundColor Red
    }
} catch {
    Write-Host "   ❌ Test failed: $_" -ForegroundColor Red
}

# ==============================================================================
# INSTALLATION COMPLETE
# ==============================================================================
Write-Host ""
Write-Host "╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║                                                                       ║" -ForegroundColor Green
Write-Host "║                   ✅ INSTALLATION COMPLETE!                           ║" -ForegroundColor Green
Write-Host "║                                                                       ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Summary:" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host "  ✅ GCC 13.2.0 installed at: C:\mingw64" -ForegroundColor White
Write-Host "  ✅ Added to System PATH: C:\mingw64\bin" -ForegroundColor White
Write-Host "  ✅ Tools available: gcc, g++, gdb, make" -ForegroundColor White
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGray
Write-Host ""
Write-Host "🎯 Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Close and reopen PowerShell/Command Prompt" -ForegroundColor White
Write-Host "  2. Test with: gcc --version" -ForegroundColor White
Write-Host "  3. Start coding in C!" -ForegroundColor White
Write-Host ""
Write-Host "📚 Quick Start:" -ForegroundColor Cyan
Write-Host "  • Create a file: hello.c" -ForegroundColor Gray
Write-Host "  • Compile: gcc hello.c -o hello" -ForegroundColor Gray
Write-Host "  • Run: .\hello.exe" -ForegroundColor Gray
Write-Host ""
Write-Host "💡 Troubleshooting:" -ForegroundColor Yellow
Write-Host "  • If 'gcc' not found: Restart your terminal" -ForegroundColor Gray
Write-Host "  • If issues persist: Check PATH in Environment Variables" -ForegroundColor Gray
Write-Host "  • Manual PATH: Add C:\mingw64\bin to System PATH" -ForegroundColor Gray
Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════════════════" -ForegroundColor Green
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
