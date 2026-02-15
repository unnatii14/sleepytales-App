import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FlutterTts _flutterTts = FlutterTts();
  bool _ttsInitialized = false;

  bool _isPlaying = false;
  bool _isLoading = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  String? _currentAudioUrl;
  String? _currentTitle;
  String? _currentStoryText;
  bool _usingTts = false;

  // TTS Settings
  double _speechRate = 0.45; // Slightly faster than before but still calm
  double _pitch = 1.1; // Slightly higher pitch for more engaging voice
  double _volume = 1.0;
  String? _currentVoice;
  List<dynamic> _availableVoices = [];

  // Sleep Timer
  Timer? _sleepTimer;
  int _sleepTimerMinutes = 0;
  DateTime? _sleepTimerEndTime;

  bool get isPlaying => _isPlaying;
  bool get isLoading => _isLoading;
  Duration get duration => _duration;
  Duration get position => _position;
  String? get currentAudioUrl => _currentAudioUrl;
  String? get currentTitle => _currentTitle;
  double get progress => _duration.inMilliseconds > 0
      ? _position.inMilliseconds / _duration.inMilliseconds
      : 0.0;
  int get sleepTimerMinutes => _sleepTimerMinutes;
  double get speechRate => _speechRate;
  double get pitch => _pitch;
  double get volume => _volume;
  String? get currentVoice => _currentVoice;
  List<dynamic> get availableVoices => _availableVoices;
  bool get hasSleepTimer => _sleepTimer != null && _sleepTimer!.isActive;
  Duration? get remainingSleepTime {
    if (_sleepTimerEndTime == null) return null;
    final remaining = _sleepTimerEndTime!.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  AudioPlayerProvider() {
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    // Initialize audio player streams
    _audioPlayer.durationStream.listen((d) {
      _duration = d ?? Duration.zero;
      notifyListeners();
    });

    _audioPlayer.positionStream.listen((p) {
      _position = p;
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (!_usingTts) {
        _isPlaying = state.playing;
        _isLoading =
            state.processingState == ProcessingState.loading ||
            state.processingState == ProcessingState.buffering;
        notifyListeners();
      }
    });

    _audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed && !_usingTts) {
        _position = Duration.zero;
        _isPlaying = false;
        notifyListeners();
      }
    });
  }

  // Lazy initialization of TTS - only when needed
  Future<void> _initTts() async {
    if (_ttsInitialized) return;

    // Get available voices
    try {
      _availableVoices = await _flutterTts.getVoices ?? [];

      // Try to set a more natural/pleasant voice for storytelling
      // Prefer female voices as they tend to be more soothing for children
      var preferredVoice = _availableVoices.firstWhere(
        (voice) =>
            voice['name'].toString().toLowerCase().contains('female') ||
            voice['name'].toString().toLowerCase().contains('woman') ||
            voice['name'].toString().toLowerCase().contains('enhanced') ||
            voice['name'].toString().toLowerCase().contains('natural'),
        orElse: () => _availableVoices.isNotEmpty ? _availableVoices[0] : null,
      );

      if (preferredVoice != null) {
        await _flutterTts.setVoice({
          "name": preferredVoice['name'],
          "locale": preferredVoice['locale'],
        });
        _currentVoice = preferredVoice['name'];
      }
    } catch (e) {
      debugPrint('Error setting voice: $e');
    }

    // Initialize TTS for stories - optimized for children's bedtime
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(_speechRate); // Calm and clear
    await _flutterTts.setPitch(_pitch); // Warm and engaging
    await _flutterTts.setVolume(_volume);

    _flutterTts.setCompletionHandler(() {
      if (_usingTts) {
        _isPlaying = false;
        _currentTitle = null;
        _currentStoryText = null;
        _usingTts = false;
        notifyListeners();
      }
    });

    _flutterTts.setErrorHandler((msg) {
      debugPrint("TTS Error: $msg");
      _isPlaying = false;
      _isLoading = false;
      notifyListeners();
    });

    _ttsInitialized = true;
  }

  // Add natural pauses between sentences for better storytelling
  String _addPausesToText(String text) {
    // Add longer pause after sentence endings (4 dots = ~1 second pause)
    text = text.replaceAll(RegExp(r'\.(\s+)'), '.... ');
    text = text.replaceAll(RegExp(r'!(\s+)'), '!... ');
    text = text.replaceAll(RegExp(r'\?(\s+)'), '?... ');
    // Add medium pause after commas for breathing room
    text = text.replaceAll(RegExp(r',(\s+)'), ',.. ');
    // Add pause after dialogue
    text = text.replaceAll(RegExp(r'"(\s+)'), '".. ');
    // Chapter/paragraph breaks get longer pauses
    text = text.replaceAll(RegExp(r'\n\n'), '...... ');
    return text;
  }

  // For nursery rhymes (use audio files)
  Future<void> playAudio(String audioUrl, String title) async {
    try {
      if (_currentAudioUrl == audioUrl && _isPlaying && !_usingTts) {
        await pause();
        return;
      }

      // Stop TTS if running
      if (_usingTts) {
        await _flutterTts.stop();
        _usingTts = false;
      }

      _isLoading = true;
      _currentAudioUrl = audioUrl;
      _currentTitle = title;
      _currentStoryText = null;
      notifyListeners();

      await _audioPlayer.setAsset(audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Error playing audio: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  // For stories (use TTS with natural pauses)
  Future<void> playStory(String text, String title) async {
    try {
      // Initialize TTS if not already done
      await _initTts();

      if (_currentStoryText == text && _isPlaying && _usingTts) {
        await pauseTts();
        return;
      }

      // Stop audio player if running
      await _audioPlayer.stop();

      // Stop any previous TTS
      await _flutterTts.stop();

      _usingTts = true;
      _currentStoryText = text;
      _currentTitle = title;
      _currentAudioUrl = null;
      _isPlaying = true;
      _isLoading = false;
      notifyListeners();

      // Add natural pauses for better storytelling
      final textWithPauses = _addPausesToText(text);
      await _flutterTts.speak(textWithPauses);
    } catch (e) {
      debugPrint('Error playing TTS: $e');
      _isPlaying = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> pause() async {
    if (_usingTts) {
      await pauseTts();
    } else {
      await _audioPlayer.pause();
    }
  }

  Future<void> pauseTts() async {
    await _flutterTts.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    if (_usingTts) {
      _isPlaying = true;
      notifyListeners();
      // flutter_tts continues automatically after pause
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> stop() async {
    if (_usingTts) {
      await _flutterTts.stop();
      _usingTts = false;
      _currentStoryText = null;
    } else {
      await _audioPlayer.stop();
      _position = Duration.zero;
    }
    _currentAudioUrl = null;
    _currentTitle = null;
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> setSpeed(double speed) async {
    await _flutterTts.setSpeechRate(speed);
  }

  // TTS Voice Configuration Methods
  Future<void> setSpeechRate(double rate) async {
    _speechRate = rate.clamp(0.1, 1.0);
    if (_ttsInitialized) {
      await _flutterTts.setSpeechRate(_speechRate);
    }
    notifyListeners();
  }

  Future<void> setPitch(double pitch) async {
    _pitch = pitch.clamp(0.5, 2.0);
    if (_ttsInitialized) {
      await _flutterTts.setPitch(_pitch);
    }
    notifyListeners();
  }

  Future<void> setVolume(double volume) async {
    _volume = volume.clamp(0.0, 1.0);
    if (_ttsInitialized) {
      await _flutterTts.setVolume(_volume);
    }
    notifyListeners();
  }

  Future<void> setVoice(String voiceName, String locale) async {
    if (_ttsInitialized) {
      await _flutterTts.setVoice({"name": voiceName, "locale": locale});
      _currentVoice = voiceName;
      notifyListeners();
    }
  }

  Future<void> loadAvailableVoices() async {
    if (!_ttsInitialized) await _initTts();
    notifyListeners();
  }

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void seekForward() {
    final newPosition = _position + const Duration(seconds: 10);
    if (newPosition < _duration) {
      seek(newPosition);
    }
  }

  void seekBackward() {
    final newPosition = _position - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      seek(newPosition);
    } else {
      seek(Duration.zero);
    }
  }

  // Sleep Timer Functions
  void setSleepTimer(int minutes) {
    cancelSleepTimer();

    if (minutes > 0) {
      _sleepTimerMinutes = minutes;
      _sleepTimerEndTime = DateTime.now().add(Duration(minutes: minutes));

      _sleepTimer = Timer(Duration(minutes: minutes), () async {
        await stop();
        _sleepTimerMinutes = 0;
        _sleepTimerEndTime = null;
        notifyListeners();
      });

      notifyListeners();
    }
  }

  void cancelSleepTimer() {
    _sleepTimer?.cancel();
    _sleepTimer = null;
    _sleepTimerMinutes = 0;
    _sleepTimerEndTime = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _sleepTimer?.cancel();
    _flutterTts.stop(); // Stop TTS before disposing
    _audioPlayer.dispose();
    super.dispose();
  }
}
