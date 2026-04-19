import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/story.dart';
import '../providers/audio_player_provider.dart';
import '../providers/favorites_provider.dart';
import '../data/stories_data.dart';

class StoryDetailScreen extends StatelessWidget {
  final Story story;

  const StoryDetailScreen({super.key, required this.story});

  void _navigateToStory(BuildContext context, Story newStory) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StoryDetailScreen(story: newStory),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(story.id);

    // Get all stories and find current index
    final allStories = StoriesData.stories;
    final currentIndex = allStories.indexWhere((s) => s.id == story.id);
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < allStories.length - 1;

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
            const SizedBox(height: 20),

            // Next/Previous Navigation
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: hasPrevious
                        ? () => _navigateToStory(
                            context,
                            allStories[currentIndex - 1],
                          )
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Previous Story'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: hasPrevious
                            ? const Color(0xFF6366F1)
                            : const Color(0xFF334155),
                      ),
                      foregroundColor: hasPrevious
                          ? const Color(0xFF6366F1)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: hasNext
                        ? () => _navigateToStory(
                            context,
                            allStories[currentIndex + 1],
                          )
                        : null,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Next Story'),
                    iconAlignment: IconAlignment.end,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: hasNext
                            ? const Color(0xFF6366F1)
                            : const Color(0xFF334155),
                      ),
                      foregroundColor: hasNext
                          ? const Color(0xFF6366F1)
                          : const Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
