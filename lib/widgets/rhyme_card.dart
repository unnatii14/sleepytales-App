import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/rhyme.dart';
import '../providers/audio_player_provider.dart';

class RhymeCard extends StatelessWidget {
  final Rhyme rhyme;

  const RhymeCard({super.key, required this.rhyme});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        final isCurrentRhyme = audioProvider.currentAudioUrl == rhyme.audioUrl;
        final isPlaying = isCurrentRhyme && audioProvider.isPlaying;

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF334155),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isPlaying ? Icons.pause : Icons.music_note,
                size: 32,
                color: const Color(0xFF6366F1),
              ),
            ),
            title: Text(
              rhyme.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${rhyme.duration} min',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white70),
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
                await audioProvider.playAudio(rhyme.audioUrl, rhyme.title);
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
