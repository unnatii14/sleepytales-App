# SleepyTales App - Quick Run Script
# This script runs the app in debug mode with auto-copy of APK

Write-Host "Starting SleepyTales App..." -ForegroundColor Cyan

# Clean previous build artifacts
Remove-Item -Path "build" -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
Remove-Item -Path "android\app\build\outputs\apk" -Recurse -Force -ErrorAction SilentlyContinue | Out-Null

Write-Host "Running flutter..." -ForegroundColor Cyan

# Build and copy APK in background
Start-Job -ScriptBlock {
    param($workDir)
    Set-Location $workDir
    
    # Wait for APK to be created
    $apkPath = "android\app\build\outputs\flutter-apk\app-debug.apk"
    while (!(Test-Path $apkPath)) {
        Start-Sleep -Seconds 2
    }
    
    # Copy to Flutter's expected location
    $targetDir = "build\app\outputs\flutter-apk"
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Copy-Item $apkPath -Destination "$targetDir\app-debug.apk" -Force
} -ArgumentList (Get-Location)

# Run Flutter
flutter run -d c6052c04

# Clean up job
Get-Job | Remove-Job -Force
