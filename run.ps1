# SleepyTales App - Quick Run
$source = "android\app\build\outputs\flutter-apk\app-debug.apk"
$target = "build\app\outputs\flutter-apk\app-debug.apk"

if (Test-Path $source) {
    Write-Host "Copying APK..." -ForegroundColor Cyan
    New-Item -ItemType Directory -Path "build\app\outputs\flutter-apk" -Force | Out-Null
    Copy-Item $source -Destination $target -Force
    Write-Host "Installing to device..." -ForegroundColor Cyan
    adb -s c6052c04 install -r $target
    if ($LASTEXITCODE -eq 0) {
        Write-Host "App installed!" -ForegroundColor Green
    }
} else {
    Write-Host "APK not found! Run: flutter build apk --debug" -ForegroundColor Yellow
}
