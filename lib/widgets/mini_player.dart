import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_player_provider.dart';
import 'tts_settings_dialog.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  void _showSleepTimerDialog(
    BuildContext context,
    AudioPlayerProvider provider,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sleep Timer',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24),
            if (provider.hasSleepTimer) ...[
              Text(
                'Timer active: ${provider.remainingSleepTime}',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF6366F1)),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  provider.cancelSleepTimer();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel),
                label: const Text('Cancel Timer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ] else ...[
              _buildTimerButton(context, provider, '15 minutes', 15),
              const SizedBox(height: 12),
              _buildTimerButton(context, provider, '30 minutes', 30),
              const SizedBox(height: 12),
              _buildTimerButton(context, provider, '60 minutes', 60),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTimerButton(
    BuildContext context,
    AudioPlayerProvider provider,
    String label,
    int minutes,
  ) {
    return ElevatedButton(
      onPressed: () {
        provider.setSleepTimer(minutes);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sleep timer set for $minutes minutes'),
            duration: const Duration(seconds: 2),
            backgroundColor: const Color(0xFF6366F1),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF334155),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        if (audioProvider.currentAudioUrl == null) {
          return const SizedBox.shrink();
        }

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Progress Bar
              LinearProgressIndicator(
                value: audioProvider.progress,
                backgroundColor: const Color(0xFF334155),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF6366F1),
                ),
                minHeight: 3,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Row 1: Title + Play/Pause
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                audioProvider.currentTitle ?? '',
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${_formatDuration(audioProvider.position)} / ${_formatDuration(audioProvider.duration)}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        // Primary play/pause button
                        IconButton(
                          icon: Icon(
                            audioProvider.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                          ),
                          iconSize: 42,
                          onPressed: () {
                            if (audioProvider.isPlaying) {
                              audioProvider.pause();
                            } else {
                              audioProvider.resume();
                            }
                          },
                          color: const Color(0xFF6366F1),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                    // Row 2: Secondary controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Seek back
                        IconButton(
                          icon: const Icon(Icons.replay_10),
                          iconSize: 22,
                          onPressed: () => audioProvider.seekBackward(),
                          color: const Color(0xFFCBD5E1),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        // Loop
                        IconButton(
                          icon: Icon(
                            audioProvider.isLooping
                                ? Icons.repeat_one
                                : Icons.repeat,
                            size: 22,
                          ),
                          onPressed: () => audioProvider.toggleLoop(),
                          color: audioProvider.isLooping
                              ? const Color(0xFF6366F1)
                              : const Color(0xFFCBD5E1),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        // Sleep Timer
                        IconButton(
                          icon: Icon(
                            audioProvider.hasSleepTimer
                                ? Icons.timer
                                : Icons.timer_outlined,
                            size: 22,
                          ),
                          onPressed: () =>
                              _showSleepTimerDialog(context, audioProvider),
                          color: audioProvider.hasSleepTimer
                              ? const Color(0xFF6366F1)
                              : const Color(0xFFCBD5E1),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        // Seek forward
                        IconButton(
                          icon: const Icon(Icons.forward_10),
                          iconSize: 22,
                          onPressed: () => audioProvider.seekForward(),
                          color: const Color(0xFFCBD5E1),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        // TTS Settings (only for narrated stories)
                        if (audioProvider.currentTitle != null &&
                            audioProvider.currentAudioUrl == null)
                          IconButton(
                            icon: const Icon(Icons.tune, size: 22),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const TtsSettingsDialog(),
                              );
                            },
                            color: const Color(0xFFCBD5E1),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        else
                          const SizedBox(width: 22),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
