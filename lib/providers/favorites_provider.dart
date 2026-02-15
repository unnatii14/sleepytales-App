import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/story.dart';
import '../data/stories_data.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favoriteIds = {};
  bool _isLoaded = false;

  Set<String> get favoriteIds => _favoriteIds;
  bool get isLoaded => _isLoaded;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList('favorites') ?? [];
      _favoriteIds.clear();
      _favoriteIds.addAll(favorites);
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading favorites: $e');
      _isLoaded = true;
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('favorites', _favoriteIds.toList());
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  bool isFavorite(String storyId) {
    return _favoriteIds.contains(storyId);
  }

  Future<void> toggleFavorite(String storyId) async {
    if (_favoriteIds.contains(storyId)) {
      _favoriteIds.remove(storyId);
    } else {
      _favoriteIds.add(storyId);
    }
    notifyListeners();
    await _saveFavorites();
  }

  List<Story> getFavoriteStories() {
    if (!_isLoaded) return [];
    final allStories = StoriesData.stories;
    return allStories
        .where((story) => _favoriteIds.contains(story.id))
        .toList();
  }

  int get favoritesCount => _favoriteIds.length;
}
