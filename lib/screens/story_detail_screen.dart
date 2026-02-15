import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/story.dart';
import '../providers/audio_player_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/tts_settings_dialog.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(story.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => favoritesProvider.toggleFavorite(story.id),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(story.title, style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 16),

            // Category and Duration
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    story.category,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF6366F1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(
                  '${story.duration} min',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Rating
            Row(
              children: [
                RatingBarIndicator(
                  rating: story.rating,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Color(0xFFF59E0B)),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
                const SizedBox(width: 8),
                Text(
                  story.rating.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Description Label
            Text('Description', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            // Description Text
            Text(
              story.description,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.5),
            ),

            // Tags
            if (story.tags.isNotEmpty) ...[
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: story.tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: const Color(0xFF334155),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 32),

            // Narration Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1).withOpacity(0.15),
                    const Color(0xFF8B5CF6).withOpacity(0.15),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF6366F1).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.record_voice_over,
                      color: Color(0xFF6366F1),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'AI Narrator',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Customize voice speed, pitch & volume',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Color(0xFF6366F1)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const TtsSettingsDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Play Button
            Consumer<AudioPlayerProvider>(
              builder: (context, audioProvider, child) {
                final isCurrentStory =
                    audioProvider.currentTitle == story.title;
                final isPlaying = isCurrentStory && audioProvider.isPlaying;

                return SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      audioProvider.playStory(story.description, story.title);
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 28,
                    ),
                    label: Text(
                      isPlaying ? 'Pause Story' : 'Play Story',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
