import 'package:flutter/material.dart';
import '../data/stories_data.dart';
import '../models/story.dart';
import '../screens/story_detail_screen.dart';

class StorySearchDelegate extends SearchDelegate<Story?> {
  @override
  String get searchFieldLabel => 'Search stories...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F172A),
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: Colors.white.withOpacity(0.3)),
            const SizedBox(height: 16),
            Text(
              'Search for stories',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: const Color(0xFF94A3B8)),
            ),
          ],
        ),
      );
    }

    // Get all stories and filter by search query
    final allStories = StoriesData.stories;
    final results = allStories.where((story) {
      final titleLower = story.title.toLowerCase();
      final categoryLower = story.category.toLowerCase();
      final queryLower = query.toLowerCase();
      return titleLower.contains(queryLower) ||
          categoryLower.contains(queryLower);
    }).toList();

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'No stories found',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: const Color(0xFF94A3B8)),
            ),
            const SizedBox(height: 8),
            Text(
              'Try a different search term',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: const Color(0xFF64748B)),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final story = results[index];
        return _buildSearchResultCard(context, story);
      },
    );
  }

  Widget _buildSearchResultCard(BuildContext context, Story story) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF1E293B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          close(context, story);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryDetailScreen(story: story),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Story Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _getCategoryGradient(story.category),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _getCategoryIcon(story.category),
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Story Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF334155),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            story.category,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 11),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 12,
                          color: const Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${story.duration} min',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: const Color(0xFF94A3B8)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: const Color(0xFF64748B),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getCategoryGradient(String category) {
    switch (category.toLowerCase()) {
      case 'animals':
        return [const Color(0xFF10B981), const Color(0xFF059669)];
      case 'space':
        return [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)];
      case 'fairy tales':
        return [const Color(0xFFEC4899), const Color(0xFFDB2777)];
      case 'magical world':
        return [const Color(0xFFA855F7), const Color(0xFF9333EA)];
      case 'adventures':
        return [const Color(0xFFF97316), const Color(0xFFEA580C)];
      case 'nature':
        return [const Color(0xFF22C55E), const Color(0xFF16A34A)];
      case 'moral stories':
        return [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)];
      default:
        return [const Color(0xFF6366F1), const Color(0xFF4F46E5)];
    }
  }

  String _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'animals':
        return '🐾';
      case 'space':
        return '🚀';
      case 'fairy tales':
        return '👑';
      case 'magical world':
        return '✨';
      case 'adventures':
        return '🗺️';
      case 'nature':
        return '🌿';
      case 'moral stories':
        return '💡';
      default:
        return '📖';
    }
  }
}
