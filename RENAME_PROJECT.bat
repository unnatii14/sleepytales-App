@echo off
echo ======================================
echo   SleepyTales Project Rename
echo ======================================
echo.
echo This will rename the project folder to remove the space
echo which causes Gradle build issues.
echo.
echo IMPORTANT STEPS:
echo 1. Close VS Code completely
echo 2. Close this terminal
echo 3. In File Explorer, rename the folder:
echo    From: SleepyTales App
echo    To:   SleepyTalesApp
echo 4. Reopen VS Code with the renamed folder
echo 5. Run: flutter clean
echo 6. Run: flutter run
echo.
echo After renaming, flutter run will work without errors!
echo.
pause
