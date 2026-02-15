import '../models/story.dart';
import '../models/category.dart';
import 'all_stories_full.dart';

class StoriesData {
  static final List<StoryCategory> categories = [
    StoryCategory(
      id: 'animals',
      name: 'Animals',
      emoji: '🐾',
      storyCount: 7,
      description: 'Adorable animal adventures',
    ),
    StoryCategory(
      id: 'space',
      name: 'Space',
      emoji: '🚀',
      storyCount: 4,
      description: 'Journey through the cosmos',
    ),
    StoryCategory(
      id: 'magical',
      name: 'Magical World',
      emoji: '✨',
      storyCount: 3,
      description: 'Enchanting magical tales',
    ),
    StoryCategory(
      id: 'adventures',
      name: 'Adventures',
      emoji: '🗺️',
      storyCount: 5,
      description: 'Exciting explorations',
    ),
    StoryCategory(
      id: 'fairy-tales',
      name: 'Fairy Tales',
      emoji: '👸',
      storyCount: 10,
      description: 'Classic fairy tale magic',
    ),
    StoryCategory(
      id: 'moral',
      name: 'Moral Stories',
      emoji: '💭',
      storyCount: 4,
      description: 'Stories with life lessons',
    ),
    StoryCategory(
      id: 'nature',
      name: 'Nature',
      emoji: '🌳',
      storyCount: 9,
      description: 'Beautiful nature tales',
    ),
  ];

  // Use the comprehensive story collection from all_stories_full.dart
  static List<Story> get stories => AllStoriesData.getAllStories();

  static List<Story> getFeaturedStories() {
    return AllStoriesData.getFeaturedStories();
  }

  static List<Story> getStoriesByCategory(String category) {
    final categoryMap = {
      'animals': 'Animals',
      'space': 'Space',
      'magical': 'Magical World',
      'adventures': 'Adventures',
      'fairy-tales': 'Fairy Tales',
      'moral': 'Moral Stories',
      'nature': 'Nature',
    };
    final mappedCategory = categoryMap[category] ?? category;
    return AllStoriesData.getStoriesByCategory(mappedCategory);
  }

  static List<Story> getRecentStories() {
    // Get stories that are NOT featured to avoid duplication
    return stories.where((story) => !story.isFeatured).take(6).toList();
  }

  static List<Story> getTopRatedStories() {
    // Get top rated stories (rating >= 4.8) that are not featured
    final topStories =
        stories
            .where((story) => !story.isFeatured && story.rating >= 4.8)
            .toList()
          ..sort((a, b) => b.rating.compareTo(a.rating));
    return topStories.take(6).toList();
  }
}
