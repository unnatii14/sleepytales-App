import '../models/sleep_music.dart';

class SleepMusicData {
  static final List<SleepMusic> sleepMusic = [
    SleepMusic(
      id: '1',
      title: 'Ocean Waves',
      description: 'Calming ocean waves for deep sleep',
      category: 'Nature Sounds',
      duration: 30,
      imageUrl:
          'https://images.unsplash.com/photo-1505142468610-359e7d316be0?w=600',
      audioUrl: 'assets/audio/music/ocean-waves.mp3',
    ),
    SleepMusic(
      id: '2',
      title: 'Rain & Thunder',
      description: 'Gentle rain with distant thunder',
      category: 'Nature Sounds',
      duration: 30,
      imageUrl:
          'https://images.unsplash.com/photo-1428908728789-d2de25dbd4e2?w=600',
      audioUrl: 'assets/audio/music/rain-thunder.mp3',
    ),
    SleepMusic(
      id: '3',
      title: 'Forest Birds',
      description: 'Peaceful forest bird songs',
      category: 'Nature Sounds',
      duration: 30,
      imageUrl:
          'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=600',
      audioUrl: 'assets/audio/music/forest-birds.mp3',
    ),
    SleepMusic(
      id: '4',
      title: 'Gentle Piano Lullaby',
      description: 'Soft piano melody for bedtime',
      category: 'Lullabies',
      duration: 25,
      imageUrl:
          'https://images.unsplash.com/photo-1520523839897-bd0b52f945a0?w=600',
      audioUrl: 'assets/audio/music/piano-lullaby.mp3',
    ),
    SleepMusic(
      id: '5',
      title: 'Soft Music Box',
      description: 'Delicate music box lullaby',
      category: 'Lullabies',
      duration: 20,
      imageUrl:
          'https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600',
      audioUrl: 'assets/audio/music/music-box.mp3',
    ),
    SleepMusic(
      id: '6',
      title: 'White Noise',
      description: 'Pure white noise for blocking distractions',
      category: 'Ambient',
      duration: 60,
      imageUrl:
          'https://images.unsplash.com/photo-1518837695005-2083093ee35b?w=600',
      audioUrl: 'assets/audio/music/white-noise.mp3',
    ),
  ];

  static List<SleepMusic> getAllMusic() {
    return sleepMusic;
  }

  static List<SleepMusic> getMusicByCategory(String category) {
    return sleepMusic.where((music) => music.category == category).toList();
  }
}
