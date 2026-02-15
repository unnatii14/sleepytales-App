# SleepyTales - Build Debug APK Script
# This script builds the debug APK and copies it to where Flutter expects it

Write-Host "=======================================" -ForegroundColor Cyan
Write-Host "  Building SleepyTales Debug APK" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

# Build the APK
Write-Host "Step 1: Building APK..." -ForegroundColor Yellow
flutter build apk --debug

# Check if APK was created
$apkSource = "android\app\build\outputs\flutter-apk\app-debug.apk"
$apkDest = "build\app\outputs\flutter-apk"

if (Test-Path $apkSource) {
    Write-Host "✓ APK built successfully!" -ForegroundColor Green
    
    # Get file info
    $apk = Get-Item $apkSource
    $sizeMB = [math]::Round($apk.Length / 1MB, 2)
    Write-Host "  Size: $sizeMB MB" -ForegroundColor Gray
    
    # Copy to Flutter's expected location
    Write-Host ""
    Write-Host "Step 2: Copying APK to Flutter's location..." -ForegroundColor Yellow
    New-Item -Path $apkDest -ItemType Directory -Force | Out-Null
    Copy-Item $apkSource -Destination $apkDest -Force
    Write-Host "✓ APK copied successfully!" -ForegroundColor Green
    
    # Ask if user wants to install
    Write-Host ""
    $install = Read-Host "Install on connected device? (Y/N)"
    if ($install -eq "Y" -or $install -eq "y") {
        Write-Host "Step 3: Installing on device..." -ForegroundColor Yellow
        adb install -r $apkSource
        if ($?) {
            Write-Host "✓ App installed successfully!" -ForegroundColor Green
        } else {
            Write-Host "✗ Installation failed" -ForegroundColor Red
        }
    }
    
    Write-Host ""
    Write-Host "=======================================" -ForegroundColor Cyan
    Write-Host "  Build Complete!" -ForegroundColor Green
    Write-Host "=======================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "APK Location: $((Get-Item $apkSource).FullName)" -ForegroundColor Gray
    
} else {
    Write-Host "✗ APK not found!" -ForegroundColor Red
    Write-Host "Build may have failed. Check errors above." -ForegroundColor Red
    exit 1
}
