import '../models/sleep_music.dart';

class SleepMusicData {
  static final List<SleepMusic> sleepMusic = [
    SleepMusic(
      id: '1',
      title: 'Gentle Flute Lullaby',
      description: 'Soft breathing flute tone to ease little ones to sleep',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/g1.png',
      audioUrl: 'assets/audio/music/flute-lullaby.wav',
    ),
    SleepMusic(
      id: '2',
      title: 'Soft Rain Drops',
      description: 'Peaceful gentle raindrops — no thunder, just calm',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/g2.png',
      audioUrl: 'assets/audio/music/rain-thunder.wav',
    ),
    SleepMusic(
      id: '3',
      title: 'Morning Forest Birds',
      description: 'Soft bird whistles from a peaceful quiet forest',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/g3.png',
      audioUrl: 'assets/audio/music/forest-birds.wav',
    ),
    SleepMusic(
      id: '4',
      title: 'Brahms Lullaby',
      description: 'Classic lullaby melody played softly on piano',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/g4.png',
      audioUrl: 'assets/audio/music/piano-lullaby.wav',
    ),
    SleepMusic(
      id: '5',
      title: 'Twinkle Twinkle',
      description: 'Twinkle Twinkle Little Star on a gentle music box',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/g5.png',
      audioUrl: 'assets/audio/music/music-box.wav',
    ),
    SleepMusic(
      id: '6',
      title: 'Dreamy Lullaby Chords',
      description: 'Warm soft chord pads floating gently into sleep',
      category: 'Ambient',
      duration: 90,
      imageUrl: 'assets/images/g6.png',
      audioUrl: 'assets/audio/music/dreamy-chords.wav',
    ),
    SleepMusic(
      id: '7',
      title: 'Harp Arpeggios',
      description: 'Dreamy pentatonic harp sweeps — no sour notes possible',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/g7.png',
      audioUrl: 'assets/audio/music/harp-melody.wav',
    ),
    SleepMusic(
      id: '8',
      title: 'Crystal Wind Chimes',
      description: 'Soft bell chimes ringing gently in a calm breeze',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/g1.png',
      audioUrl: 'assets/audio/music/wind-chimes.wav',
    ),
  ];

  static List<SleepMusic> getAllMusic() {
    return sleepMusic;
  }

  static List<SleepMusic> getMusicByCategory(String category) {
    return sleepMusic.where((music) => music.category == category).toList();
  }
}
