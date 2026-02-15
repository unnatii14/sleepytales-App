# 🚀 GitHub Upload Instructions for SleepyTales App

## ⚠️ IMPORTANT: Security Checklist

Before uploading, verify these sensitive files are NOT committed:
- ✅ `android/key.properties` - Already in .gitignore
- ✅ `android/app/sleepytales-release.keystore` - Already in .gitignore  
- ✅ `*.apk` and `*.aab` files - Already in .gitignore

These files contain your signing credentials and should NEVER be public!

---

## 📤 Step-by-Step Upload Process

### Step 1: Initialize Git Repository
```powershell
cd "d:\development\workspace\SleepyTales App"
git init
git branch -M main
```

### Step 2: Stage Files
```powershell
git add .
```

### Step 3: Create Initial Commit
```powershell
git commit -m "Initial commit: SleepyTales v1.0.0 - Bedtime stories app with AI narration"
```

### Step 4: Add Remote Repository
```powershell
git remote add origin https://github.com/unnatii14/sleepytales-App.git
```

### Step 5: Push to GitHub
```powershell
git push -u origin main
```

---

## 📦 How to Share the APK File

### ✅ SAFE METHOD: Use GitHub Releases

**DO NOT commit APK files directly to the repository** (they're too large and will bloat your repo)

Instead, use GitHub Releases:

1. **Go to your GitHub repository:**
   https://github.com/unnatii14/sleepytales-App

2. **Click "Releases"** (right sidebar)

3. **Click "Create a new release"**

4. **Fill in the details:**
   - **Tag version:** `v1.0.0`
   - **Release title:** `SleepyTales v1.0.0 - Initial Release`
   - **Description:**
     ```markdown
     ## 🌙 First Official Release!
     
     ### What's Included
     - 42 bedtime stories across 7 categories
     - 14 nursery rhymes with audio
     - AI-powered narration with customizable voice
     - Sleep timer functionality
     - Favorites system
     - 100% offline support
     
     ### 📥 Download
     - **APK Size:** 98 MB
     - **Requirements:** Android 7.0+ (API 24)
     
     ### Installation
     1. Download `sleepytales-release.apk`
     2. Enable "Install from unknown sources" in Android settings
     3. Open the APK file and install
     ```

5. **Attach the APK file:**
   - Drag and drop: `sleepytales-release.apk` (from your workspace root)

6. **Click "Publish release"**

---

## ✅ Verification Checklist

After upload, verify:
- [ ] README.md displays correctly on GitHub
- [ ] LICENSE file is visible
- [ ] No sensitive files (keystore, key.properties) in repository
- [ ] APK is available in Releases section
- [ ] Repository description is set: "🌙 Beautiful bedtime stories & lullabies app for children with AI narration"
- [ ] Topics added: `flutter`, `android`, `bedtime-stories`, `kids-app`, `text-to-speech`

---

## 🔄 Future Updates

When you release updates:
```powershell
# Update version in pubspec.yaml first, then:
flutter build apk --release
git add .
git commit -m "Release v1.1.0: [describe changes]"
git push
# Then create new release on GitHub with updated APK
```

---

## ✅ Your Repository is Ready!

**All Files Configured:**
- ✅ Professional README.md (100 lines)
- ✅ MIT License
- ✅ .gitignore protects sensitive data
- ✅ APK ready for GitHub Releases

**You can safely upload to:**
https://github.com/unnatii14/sleepytales-App
