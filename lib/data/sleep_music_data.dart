import '../models/sleep_music.dart';

class SleepMusicData {
  static final List<SleepMusic> sleepMusic = [
    SleepMusic(
      id: '1',
      title: 'Gentle Flute Lullaby',
      description: 'Soft breathing flute tones to ease little ones into sleep',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/The Sleepy Moon\'s Lullaby.jpeg',
      audioUrl: 'assets/audio/music/flute-lullaby.mp3',
    ),
    SleepMusic(
      id: '2',
      title: 'Soft Rain Drops',
      description: 'Peaceful gentle raindrops — no thunder, just pure calm',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/Cloud Who Wanted to Be Rain.jpeg',
      audioUrl: 'assets/audio/music/rain-thunder.mp3',
    ),
    SleepMusic(
      id: '3',
      title: 'Morning Forest Birds',
      description: 'Soft bird whistles drifting through a peaceful forest',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/The Snowy Owl and the Northern Lights.jpg',
      audioUrl: 'assets/audio/music/forest-birds.mp3',
    ),
    SleepMusic(
      id: '4',
      title: 'Brahms Lullaby',
      description: 'Classic lullaby melody played softly on piano',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/The Magical Music Box.jpg',
      audioUrl: 'assets/audio/music/piano-lullaby.mp3',
    ),
    SleepMusic(
      id: '5',
      title: 'Twinkle Twinkle',
      description: 'Twinkle Twinkle Little Star on a delicate music box',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/The Moon that Wanted to Dream.jpg',
      audioUrl: 'assets/audio/music/music-box.mp3',
    ),
    SleepMusic(
      id: '6',
      title: 'Dreamy Lullaby Chords',
      description: 'Warm soft chord pads floating gently into dreamland',
      category: 'Ambient',
      duration: 90,
      imageUrl: 'assets/images/The Elephant Who Painted Dreams.jpg',
      audioUrl: 'assets/audio/music/dreamy-chords.mp3',
    ),
    SleepMusic(
      id: '7',
      title: 'Harp Arpeggios',
      description: 'Dreamy pentatonic harp sweeps — pure and soothing',
      category: 'Lullabies',
      duration: 90,
      imageUrl: 'assets/images/The Dove Who Delivered Dreams.jpeg',
      audioUrl: 'assets/audio/music/harp-melody.mp3',
    ),
    SleepMusic(
      id: '8',
      title: 'Crystal Wind Chimes',
      description: 'Soft bell chimes ringing gently in a calm breeze',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/The Cricket and the silent Night.jpg',
      audioUrl: 'assets/audio/music/wind-chimes.mp3',
    ),
    SleepMusic(
      id: '9',
      title: 'Ocean Waves',
      description: 'Slow rolling ocean waves — nature\'s own white noise',
      category: 'Nature Sounds',
      duration: 90,
      imageUrl: 'assets/images/The Starfish and The Gentle Tide.jpg',
      audioUrl: 'assets/audio/music/ocean-waves.mp3',
    ),
  ];

  static List<SleepMusic> getAllMusic() => sleepMusic;

  static List<SleepMusic> getMusicByCategory(String category) {
    if (category == 'All') return sleepMusic;
    return sleepMusic.where((m) => m.category == category).toList();
  }

  static List<String> getCategories() {
    final cats = sleepMusic.map((m) => m.category).toSet().toList();
    cats.sort();
    return ['All', ...cats];
  }
}
