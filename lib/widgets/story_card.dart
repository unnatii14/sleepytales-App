import 'package:flutter/material.dart';
import '../models/story.dart';
import '../screens/story_detail_screen.dart';

class StoryCard extends StatelessWidget {
  final Story story;
  final double? width;

  const StoryCard({super.key, required this.story, this.width});

  List<Color> _getCategoryGradient(String category) {
    switch (category) {
      case 'Animals':
        return [const Color(0xFF10B981), const Color(0xFF059669)];
      case 'Space':
        return [const Color(0xFF3B82F6), const Color(0xFF1D4ED8)];
      case 'Nature':
        return [const Color(0xFF22C55E), const Color(0xFF16A34A)];
      case 'Adventures':
        return [const Color(0xFFF59E0B), const Color(0xFFD97706)];
      case 'Magical World':
        return [const Color(0xFFA855F7), const Color(0xFF9333EA)];
      case 'Fairy Tales':
        return [const Color(0xFFEC4899), const Color(0xFFDB2777)];
      case 'Moral Stories':
        return [const Color(0xFF8B5CF6), const Color(0xFF7C3AED)];
      default:
        return [const Color(0xFF6366F1), const Color(0xFF4F46E5)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryDetailScreen(story: story),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: _getCategoryGradient(story.category),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                story.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.category_outlined,
                        size: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          story.category,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${story.duration} min',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Color(0xFFFBBF24),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        story.rating.toString(),
                        style: const TextStyle(
                          color: Color(0xFFFBBF24),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
