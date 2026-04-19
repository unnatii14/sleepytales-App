import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_stories_screen.dart';

class CategoryGridItem extends StatelessWidget {
  final StoryCategory category;

  const CategoryGridItem({super.key, required this.category});

  // Each category gets its own colour identity
  Color _categoryColor(String name) {
    switch (name) {
      case 'Animals':        return const Color(0xFF10B981);
      case 'Space':          return const Color(0xFF3B82F6);
      case 'Nature':         return const Color(0xFF22C55E);
      case 'Adventures':     return const Color(0xFFF59E0B);
      case 'Magical World':  return const Color(0xFFA855F7);
      case 'Fairy Tales':    return const Color(0xFFEC4899);
      case 'Moral Stories':  return const Color(0xFF8B5CF6);
      default:               return const Color(0xFF6366F1);
    }
  }

  // Representative story image for each category
  String _categoryImage(String name) {
    switch (name) {
      case 'Animals':
        return 'assets/images/Brave Little Penguin.jpeg';
      case 'Space':
        return 'assets/images/The Moon that Wanted to Dream.png';
      case 'Nature':
        return 'assets/images/The Snowy Owl and the Northern Lights.png';
      case 'Adventures':
        return 'assets/images/The Turtle Who Chased the Sunset.png';
      case 'Magical World':
        return 'assets/images/The Sleepy Dragon Who Couldnt Roar.png';
      case 'Fairy Tales':
        return 'assets/images/Cinderella.png';
      case 'Moral Stories':
        return 'assets/images/The Wise Owl and The Worried Rabbit.png';
      default:
        return 'assets/images/The Moon that Wanted to Dream.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(category.name);
    final image = _categoryImage(category.name);

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryStoriesScreen(category: category),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // ── Background image ───────────────────────────────────────
              Image.asset(
                image,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [color, color.withOpacity(0.6)],
                    ),
                  ),
                ),
              ),

              // ── Dark gradient overlay ──────────────────────────────────
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.72),
                    ],
                  ),
                ),
              ),

              // ── Coloured top-left accent bar ───────────────────────────
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withOpacity(0.4)],
                    ),
                  ),
                ),
              ),

              // ── Story count badge (top right) ──────────────────────────
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${category.storyCount} stories',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // ── Main content (bottom) ──────────────────────────────────
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Emoji in a frosted pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          category.emoji,
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Category name
                      Text(
                        category.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      // Description
                      Text(
                        category.description,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 11,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),

              // ── Tap ripple ────────────────────────────────────────────
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: color.withOpacity(0.2),
                    highlightColor: Colors.transparent,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CategoryStoriesScreen(category: category),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
