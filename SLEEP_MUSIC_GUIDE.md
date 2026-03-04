# 🎵 Sleep Music Setup Guide

## ⚠️ Current Status:
The sleep music files are **placeholder files only**. You need to add actual MP3 audio files.

## 📁 Required Files Location:
`assets/audio/music/`

## 🎼 Required Music Files:

1. **ocean-waves.mp3** - Ocean wave sounds (30 min recommended)
2. **rain-thunder.mp3** - Rain with distant thunder (30 min)
3. **forest-birds.mp3** - Peaceful forest birdsong (30 min)
4. **piano-lullaby.mp3** - Soft piano melody (25 min)
5. **music-box.mp3** - Delicate music box lullaby (20 min)
6. **white-noise.mp3** - Gentle white noise (30 min)
7. **harp-melody.mp3** - Soothing harp music (25 min)
8. **wind-chimes.mp3** - Gentle wind chime sounds (20 min)

## 🌟 Where to Get Royalty-Free Sleep Music:

### Free Sources:
1. **Pixabay Music** - https://pixabay.com/music/
   - Search: "lullaby", "sleep music", "ambient"
   - Completely free, no attribution required

2. **YouTube Audio Library** - https://studio.youtube.com/channel/UC.../music
   - Free music for creators
   - Filter by "Ambient" mood

3. **Free Music Archive** - https://freemusicarchive.org/
   - Search for "Creative Commons" licensed sleep music
   - Check license requirements

4. **Incompetech** - https://incompetech.com/music/
   - Royalty-free music by Kevin MacLeod
   - Requires attribution

### Nature Sounds:
1. **Freesound.org** - https://freesound.org/
   - Search: "ocean waves", "rain", "forest", "birds"
   - Creative Commons licensed
   - Free with attribution

2. **Zapsplat** - https://www.zapsplat.com/
   - Free sound effects
   - Create free account

3. **BBC Sound Effects** - https://sound-effects.bbcrewind.co.uk/
   - 16,000+ BBC sound effects
   - Free for personal use

## 🎨 How to Add Music Files:

1. **Download MP3 files** from the sources above
2. **Rename them** according to the list above
3. **Copy them** to: `assets/audio/music/`
4. **Check file sizes** - Keep under 10MB each for app size
5. **Test in app** - Play each one to verify

## ⚡ Quick Setup Commands:

After downloading your MP3 files:

```powershell
# Copy your files to the music folder
Copy-Item "path\to\your\ocean-waves.mp3" "assets\audio\music\"
Copy-Item "path\to\your\rain-thunder.mp3" "assets\audio\music\"
# ... repeat for all files

# Rebuild the app
flutter clean
flutter build apk --debug
```

## 🔧 Alternative: Use Shorter Loops

If file sizes are too large, you can:
- Use **5-10 minute loops** that repeat
- The audio player will loop automatically
- Smaller files = smaller app size

## 📝 Recommended Audio Settings:

- **Format:** MP3
- **Bitrate:** 128 kbps (good quality, small size)
- **Length:** 5-30 minutes
- **Sample Rate:** 44.1 kHz
- **Channels:** Stereo or Mono

## 🎯 Pro Tips:

1. **Convert to MP3** if needed:
   - Use https://cloudconvert.com/
   - Or use Audacity (free software)

2. **Trim audio**:
   - Remove silence at start/end
   - Use Audacity or online tools

3. **Compress size**:
   - Use lower bitrate (96-128 kbps is fine for sleep sounds)
   - Mono channel for nature sounds (cuts size in half)

4. **Test before adding**:
   - Play files on your computer first
   - Check for clicks, pops, or quality issues

## 🚀 Once Files Are Added:

The Sleep Music screen will work automatically! The app is already configured to:
- ✅ Display all music tracks
- ✅ Play with controls (play/pause/seek)
- ✅ Show progress bar
- ✅ Background playback
- ✅ Sleep timer integration

No code changes needed - just add the MP3 files! 🎉
