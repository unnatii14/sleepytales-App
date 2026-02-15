# SleepyTales - Rename Project Script
# This fixes the Gradle build path issue by removing the space from directory name

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "  SleepyTales Project Rename Script" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

$currentDir = Get-Location
$parentDir = Split-Path -Parent $currentDir
$currentName = Split-Path -Leaf $currentDir
$newName = "SleepyTalesApp"
$newPath = Join-Path $parentDir $newName

Write-Host "Current location: $currentDir" -ForegroundColor Yellow
Write-Host "New location:     $newPath" -ForegroundColor Green
Write-Host ""

# Check if already renamed
if ($currentName -eq $newName) {
    Write-Host "✓ Project already renamed to '$newName'" -ForegroundColor Green
    Write-Host "  No space in directory name - Gradle should work now!" -ForegroundColor Green
    exit 0
}

# Check if target exists
if (Test-Path $newPath) {
    Write-Host "✗ Error: Directory '$newName' already exists!" -ForegroundColor Red
    Write-Host "  Please manually rename or delete the existing directory." -ForegroundColor Yellow
    exit 1
}

Write-Host "IMPORTANT:" -ForegroundColor Yellow
Write-Host "1. Save all your open files in VS Code" -ForegroundColor White
Write-Host "2. Close VS Code completely" -ForegroundColor White
Write-Host "3. Run this script again" -ForegroundColor White
Write-Host "4. Reopen VS Code from the new location: $newPath" -ForegroundColor White
Write-Host ""

$response = Read-Host "Has VS Code been closed? (y/n)"

if ($response -ne 'y' -and $response -ne 'Y') {
    Write-Host ""
    Write-Host "Please close VS Code first, then run this script again." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "Renaming project..." -ForegroundColor Cyan

try {
    # Move to parent directory
    Set-Location $parentDir
    
    # Rename the directory
    Rename-Item -Path $currentDir -NewName $newName -ErrorAction Stop
    
    Write-Host ""
    Write-Host "✓ Successfully renamed!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Open VS Code" -ForegroundColor White
    Write-Host "2. File → Open Folder → Select: $newPath" -ForegroundColor White
    Write-Host "3. Run: flutter clean" -ForegroundColor White
    Write-Host "4. Run: flutter run -d c6052c04" -ForegroundColor White
    Write-Host ""
    Write-Host "✓ Gradle build path issue should now be fixed! 🎉" -ForegroundColor Green
    
} catch {
    Write-Host ""
    Write-Host "✗ Error renaming directory:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Write-Host "Manual steps:" -ForegroundColor Yellow
    Write-Host "1. Close VS Code" -ForegroundColor White
    Write-Host "2. Close this PowerShell window" -ForegroundColor White
    Write-Host "3. In File Explorer, rename:" -ForegroundColor White
    Write-Host "   From: D:\development\workspace\SleepyTales App" -ForegroundColor White
    Write-Host "   To:   D:\development\workspace\SleepyTalesApp" -ForegroundColor White
    Write-Host "4. Reopen VS Code with the renamed folder" -ForegroundColor White
    exit 1
}
