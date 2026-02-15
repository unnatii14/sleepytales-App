# SleepyTales - Complete Build Script
# Builds both APK and AAB files

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("debug", "release", "both")]
    [string]$BuildType = "debug"
)

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "       SleepyTales Build Script" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Stop"

function Build-DebugAPK {
    Write-Host "Building Debug APK..." -ForegroundColor Yellow
    Write-Host ""
    
    flutter build apk --debug
    
    $apkSource = "android\app\build\outputs\flutter-apk\app-debug.apk"
    
    if (Test-Path $apkSource) {
        $apk = Get-Item $apkSource
        $sizeMB = [math]::Round($apk.Length / 1MB, 2)
        
        Write-Host "✓ Debug APK built: $sizeMB MB" -ForegroundColor Green
        
        # Copy to Flutter's expected location
        $apkDest = "build\app\outputs\flutter-apk"
        New-Item -Path $apkDest -ItemType Directory -Force | Out-Null
        Copy-Item $apkSource -Destination $apkDest -Force
        
        # Copy to root for easy access
        Copy-Item $apkSource -Destination "sleepytales-debug.apk" -Force
        Write-Host "✓ Copied to: sleepytales-debug.apk" -ForegroundColor Green
        Write-Host ""
        
        return $true
    } else {
        Write-Host "✗ APK build failed" -ForegroundColor Red
        return $false
    }
}

function Build-ReleaseAAB {
    Write-Host "Building Release AAB..." -ForegroundColor Yellow
    Write-Host ""
    
    flutter build appbundle --release
    
    $aabSource = "android\app\build\outputs\bundle\release\app-release.aab"
    
    if (Test-Path $aabSource) {
        $aab = Get-Item $aabSource
        $sizeMB = [math]::Round($aab.Length / 1MB, 2)
        
        Write-Host "✓ Release AAB built: $sizeMB MB" -ForegroundColor Green
        
        # Copy to root for easy access
        Copy-Item $aabSource -Destination "sleepytales-release.aab" -Force
        Write-Host "✓ Copied to: sleepytales-release.aab" -ForegroundColor Green
        Write-Host ""
        
        return $true
    } else {
        Write-Host "✗ AAB build failed" -ForegroundColor Red
        return $false
    }
}

# Execute builds based on parameter
$success = $true

if ($BuildType -eq "debug" -or $BuildType -eq "both") {
    $success = Build-DebugAPK
    if (-not $success) { exit 1 }
}

if ($BuildType -eq "release" -or $BuildType -eq "both") {
    if ($BuildType -eq "both") {
        Write-Host "----------------------------------------" -ForegroundColor Gray
        Write-Host ""
    }
    $success = Build-ReleaseAAB
    if (-not $success) { exit 1 }
}

# Summary
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "       Build Complete!" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

if ($BuildType -eq "debug" -or $BuildType -eq "both") {
    Write-Host "Debug APK:" -ForegroundColor Gray
    Write-Host "  sleepytales-debug.apk" -ForegroundColor White
    Write-Host ""
}

if ($BuildType -eq "release" -or $BuildType -eq "both") {
    Write-Host "Release AAB (Play Store):" -ForegroundColor Gray
    Write-Host "  sleepytales-release.aab" -ForegroundColor White
    Write-Host ""
}

# Ask if user wants to install debug APK
if ($BuildType -eq "debug" -or $BuildType -eq "both") {
    $install = Read-Host "Install debug APK on connected device? (Y/N)"
    if ($install -eq "Y" -or $install -eq "y") {
        Write-Host ""
        Write-Host "Installing..." -ForegroundColor Yellow
        adb install -r "android\app\build\outputs\flutter-apk\app-debug.apk"
        if ($?) {
            Write-Host "✓ Installed successfully!" -ForegroundColor Green
        }
    }
}

Write-Host ""
Write-Host "Done! ✨" -ForegroundColor Cyan
Write-Host ""
