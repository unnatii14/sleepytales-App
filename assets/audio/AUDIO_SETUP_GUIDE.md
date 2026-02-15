# Audio Files Setup Guide

## 📝 Instructions

Place your audio files from the sleepytales_flutter folder into these directories:

### Stories Audio Files
Place in: `assets/audio/stories/`

Required files (based on stories_data.dart):
- squirrel_wish.mp3
- brave_bunny.mp3
- wise_owl.mp3
- butterfly_garden.mp3
- moon_lullaby.mp3
- stella_star.mp3
- cloud_rain.mp3
- whispering_woods.mp3
- gentle_giant.mp3
- magic_paintbrush.mp3
- enchanted_garden.mp3
- treasure_hunt.mp3
- sharing_tree.mp3

### Rhymes Audio Files
Place in: `assets/audio/rhymes/`

Required files (based on rhymes_data.dart):
- twinkle_star.mp3
- rock_a_bye.mp3
- hush_baby.mp3
- brahms_lullaby.mp3
- star_bright.mp3
- sleep_baby.mp3

### Sleep Music Files
Place in: `assets/audio/music/`

Required files (based on sleep_music_data.dart):
- ocean_waves.mp3
- rainfall.mp3
- forest_night.mp3
- white_noise.mp3
- piano_lullaby.mp3
- music_box.mp3

## 🔧 How to Add Files

1. Copy your audio files from the sleepytales_flutter folder
2. Rename them to match the names above (if different)
3. Paste them into the corresponding folders
4. Run `flutter pub get` to refresh assets
5. Run the app!

## 📌 Notes

- Audio files should be in .mp3 format for best compatibility
- Keep file sizes reasonable for app size (consider compression)
- Test each audio file to ensure it plays correctly
- If you have different file names, update the audioUrl in the respective data files:
  - lib/data/stories_data.dart
  - lib/data/rhymes_data.dart
  - lib/data/sleep_music_data.dart
