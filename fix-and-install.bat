@echo off
REM Quick fix for Flutter APK location issue
echo Copying APK to Flutter's expected location...

if exist "android\app\build\outputs\flutter-apk\app-debug.apk" (
    if not exist "build\app\outputs\flutter-apk" mkdir "build\app\outputs\flutter-apk"
    copy /Y "android\app\build\outputs\flutter-apk\app-debug.apk" "build\app\outputs\flutter-apk\app-debug.apk" >nul
    echo APK copied successfully!
    echo Installing to device...
    flutter install
) else (
    echo Error: APK not found!
    echo Run: flutter build apk --debug
)
