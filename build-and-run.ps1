# SleepyTales - Simple Build and Run
# This script handles the APK location issue automatically

param(
    [switch]$Clean
)

if ($Clean) {
    Write-Host "Cleaning..." -ForegroundColor Yellow
    flutter clean | Out-Null
}

Write-Host "Building app..." -ForegroundColor Cyan
flutter run -d c6052c04 2>&1 | Tee-Object -Variable output

# Check if build failed due to APK location issue
if ($LASTEXITCODE -ne 0 -and $output -match "couldn't find it") {
    Write-Host "`nCopying APK to expected location..." -ForegroundColor Yellow
    
    $source = "android\app\build\outputs\flutter-apk\app-debug.apk"
    $target = "build\app\outputs\flutter-apk\app-debug.apk"
    
    if (Test-Path $source) {
        New-Item -ItemType Directory -Path "build\app\outputs\flutter-apk" -Force | Out-Null
        Copy-Item $source -Destination $target -Force
        Write-Host "APK copied! Installing..." -ForegroundColor Green
        
        # Use adb directly to install
        $deviceId = "c6052c04"
        adb -s $deviceId install -r $target
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "`n✓ App installed successfully! Launch it from your device." -ForegroundColor Green
        }
    } else {
        Write-Host "Error: APK not found at $source" -ForegroundColor Red
    }
}
