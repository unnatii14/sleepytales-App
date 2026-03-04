import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sleep_music.dart';
import '../providers/audio_player_provider.dart';

class SleepMusicCard extends StatelessWidget {
  final SleepMusic music;

  const SleepMusicCard({super.key, required this.music});

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'nature sounds':
      case 'nature':
        return Icons.forest;
      case 'white noise':
      case 'ambient':
        return Icons.waves;
      case 'lullabies':
      case 'lullaby':
        return Icons.piano;
      default:
        return Icons.music_note;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        final isCurrentMusic = audioProvider.currentAudioUrl == music.audioUrl;
        final isPlaying = isCurrentMusic && audioProvider.isPlaying;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF334155),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: isCurrentMusic
                    ? const Color(0xFF6366F1).withOpacity(0.25)
                    : const Color(0xFF475569),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(music.category),
                size: 28,
                color: isCurrentMusic
                    ? const Color(0xFF6366F1)
                    : const Color(0xFF94A3B8),
              ),
            ),
            title: Text(
              music.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Row(
              children: [
                Icon(
                  _getCategoryIcon(music.category),
                  size: 14,
                  color: Colors.white70,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${music.category} • ${music.duration} min',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_filled,
                size: 40,
                color: const Color(0xFF6366F1),
              ),
              onPressed: () async {
                await audioProvider.playAudio(music.audioUrl, music.title);
                if (audioProvider.errorMessage != null && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.error_outline, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(child: Text(audioProvider.errorMessage!)),
                        ],
                      ),
                      backgroundColor: const Color(0xFFEF4444),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 4),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
