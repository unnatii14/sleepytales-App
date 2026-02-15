import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sleep_music.dart';
import '../providers/audio_player_provider.dart';

class MusicCard extends StatelessWidget {
  final SleepMusic music;

  const MusicCard({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        final isCurrentMusic = audioProvider.currentAudioUrl == music.audioUrl;
        final isPlaying = isCurrentMusic && audioProvider.isPlaying;

        return GestureDetector(
          onTap: () {
            audioProvider.playAudio(music.audioUrl, music.title);
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF334155),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isPlaying ? Icons.pause_circle : Icons.music_note,
                    size: 28,
                    color: isCurrentMusic
                        ? const Color(0xFF6366F1)
                        : const Color(0xFF94A3B8),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    music.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        size: 11,
                        color: const Color(0xFF94A3B8),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${music.duration} min',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF94A3B8),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      music.category,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6366F1),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
