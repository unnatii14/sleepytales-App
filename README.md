# 🌙 SleepyTales - Bedtime Stories & Lullabies

> A beautifully crafted Flutter mobile app that helps children drift into peaceful sleep with enchanting bedtime stories and soothing nursery rhymes, featuring AI-powered narration optimized for nighttime use.

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8.1-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android)](https://www.android.com)

## ✨ Features

### 📚 Rich Content Library
- **42 Bedtime Stories** across 7 carefully curated categories (Animals, Space, Magical Creatures, Adventures, Fairy Tales, Moral Stories, Nature)
- **14 Classic Nursery Rhymes** with professional audio recordings
- Beautiful gradient card designs with smooth animations
- Category-based organization for easy navigation

### 🎙️ Advanced AI Narration
- Natural Text-to-Speech engine with optimized pacing for children
- **Customizable Voice Settings**: Adjust speed, pitch, and volume
- Smart voice selection (prioritizes natural/enhanced voices)
- Real-time word highlighting (coming soon)

### 🕐 Smart Features
- **Sleep Timer**: Auto-stop after 15, 30, or 60 minutes
- **Favorites System**: Bookmark your child's preferred stories
- **100% Offline**: No internet required after installation
- **Mini Player**: Control playback from anywhere in the app
- **Dark Theme**: Optimized for comfortable bedtime viewing

## 📱 Download

### For Users
📥 **[Download Latest APK](https://github.com/unnatii14/sleepytales-App/releases)**- **[Download PlayStore](https://play.google.com/store/apps/details?id=com.sleepytales.app)**(v1.0.0)

*Requires Android 7.0+ (API 24) | ~98 MB*

### For Developers
```bash
git clone https://github.com/unnatii14/sleepytales-App.git
cd sleepytales-App
flutter pub get
flutter run
```

## 🛠️ Tech Stack

| Category | Technologies |
|----------|-------------|
| **Framework** | Flutter 3.32.5, Dart 3.8.1 |
| **State Management** | Provider |
| **Audio** | just_audio, flutter_tts, audio_session |
| **UI/UX** | Material Design 3, Google Fonts (Poppins) |
| **Storage** | SharedPreferences |

## 🏗️ Build Instructions

### Prerequisites
- Flutter SDK 3.8.1+
- Android Studio or VS Code with Flutter plugins
- JDK 11+

### Development Build
```bash
flutter build apk --debug
```

### Production Build
```bash
# For Google Play Store
flutter build appbundle --release

# For direct distribution
flutter build apk --release
```

## 📂 Project Structure

```
lib/
├── config/         # App theme and configuration
├── data/           # Story and rhyme databases
├── models/         # Data models (Story, Rhyme, Category)
├── providers/      # State management (Audio, Favorites)
├── screens/        # UI screens (Home, Categories, Details)
├── widgets/        # Reusable components
└── main.dart       # App entry point

assets/
├── audio/rhymes/   # 14 MP3 nursery rhyme recordings
└── images/         # App graphics and icons
```

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs or request features via [Issues](https://github.com/unnatii14/sleepytales-App/issues)
- Submit pull requests for improvements
- Share feedback and suggestions

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Unnati**  
GitHub: [@unnatii14](https://github.com/unnatii14)

## 🙏 Acknowledgments

- Story content curated from public domain sources
- Nursery rhyme audio from royalty-free collections
- Icons and illustrations from open-source libraries

---

<div align="center">

**Made with ❤️ for sweet dreams and peaceful nights** 🌙✨

[⭐ Star this repo](https://github.com/unnatii14/sleepytales-App) • [🐛 Report Bug](https://github.com/unnatii14/sleepytales-App/issues) • [💡 Request Feature](https://github.com/unnatii14/sleepytales-App/issues)

</div>

