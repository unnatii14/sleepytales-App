import 'package:flutter/material.dart';
import '../data/stories_data.dart';
import '../data/rhymes_data.dart';
import '../models/story.dart';
import '../models/rhyme.dart';
import '../screens/rhymes_screen.dart';
import '../screens/categories_screen.dart';
import '../widgets/story_card.dart';
import '../widgets/story_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Returns a time-aware greeting + emoji
  Map<String, String> _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return {'text': 'Good Morning', 'emoji': '☀️'};
    } else if (hour >= 12 && hour < 17) {
      return {'text': 'Good Afternoon', 'emoji': '🌤️'};
    } else if (hour >= 17 && hour < 21) {
      return {'text': 'Good Evening', 'emoji': '🌙'};
    } else {
      return {'text': 'Sweet Dreams', 'emoji': '✨'};
    }
  }

  /// Returns a bedtime tip based on the hour
  String _getBedtimeTip() {
    final hour = DateTime.now().hour;
    if (hour >= 20 || hour < 5) {
      return 'A story a night keeps the bad dreams away 🌟';
    } else if (hour >= 17) {
      return 'Wind down with a calming bedtime story tonight 📖';
    } else {
      return 'Explore enchanting stories for your little one 🦋';
    }
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreeting();
    final featuredStories = StoriesData.getFeaturedStories();
    final allStories = StoriesData.stories;
    // Pick a different set for "Explore" — non-featured stories
    final exploreStories = allStories
        .where((s) => !s.isFeatured)
        .take(6)
        .toList();
    final popularRhymes = RhymesData.rhymes
        .where((r) => r.isPopular)
        .take(4)
        .toList();
    final categories = StoriesData.categories;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──────────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: _HomeHeader(
                greeting: greeting,
                tip: _getBedtimeTip(),
                isDark: isDark,
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 28)),

            // ── Featured Stories horizontal scroll ───────────────────────────
            SliverToBoxAdapter(
              child: _SectionHeader(
                emoji: '⭐',
                title: 'Featured Stories',
                onSeeAll: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategoriesScreen(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverToBoxAdapter(
              child: _FeaturedStoriesRow(stories: featuredStories),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 28)),

            // ── Category quick-access chips ──────────────────────────────────
            SliverToBoxAdapter(
              child: _SectionHeader(
                emoji: '📚',
                title: 'Browse by Category',
                onSeeAll: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategoriesScreen(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverToBoxAdapter(
              child: _CategoryChipsRow(categories: categories, context: context),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 28)),

            // ── Explore All Stories ─────────────────────────────────────────
            SliverToBoxAdapter(
              child: _SectionHeader(
                emoji: '🌙',
                title: 'Explore More Stories',
                onSeeAll: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CategoriesScreen(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.82,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => StoryCard(story: exploreStories[index]),
                  childCount: exploreStories.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 28)),

            // ── Rhymes for Tonight ──────────────────────────────────────────
            SliverToBoxAdapter(
              child: _SectionHeader(
                emoji: '🎵',
                title: 'Rhymes for Tonight',
                onSeeAll: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RhymesScreen()),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 14)),
            SliverToBoxAdapter(
              child: _RhymesRow(rhymes: popularRhymes),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header widget
// ─────────────────────────────────────────────────────────────────────────────
class _HomeHeader extends StatelessWidget {
  final Map<String, String> greeting;
  final String tip;
  final bool isDark;

  const _HomeHeader({
    required this.greeting,
    required this.tip,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF1E1B4B), const Color(0xFF0F172A)]
              : [const Color(0xFF4F46E5), const Color(0xFF6366F1)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: logo + search
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.nights_stay_rounded,
                  size: 26,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'SleepyTales',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: StorySearchDelegate(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Greeting
          Text(
            '${greeting['text']}! ${greeting['emoji']}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            tip,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Section header with "See all"
// ─────────────────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String emoji;
  final String title;
  final VoidCallback onSeeAll;

  const _SectionHeader({
    required this.emoji,
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          GestureDetector(
            onTap: onSeeAll,
            child: Text(
              'See all',
              style: TextStyle(
                color: const Color(0xFF6366F1),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Featured stories horizontal scroll
// ─────────────────────────────────────────────────────────────────────────────
class _FeaturedStoriesRow extends StatelessWidget {
  final List<Story> stories;

  const _FeaturedStoriesRow({required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: stories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) =>
            StoryCard(story: stories[index], width: 160),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Category chips horizontal scroll
// ─────────────────────────────────────────────────────────────────────────────
class _CategoryChipsRow extends StatelessWidget {
  final List categories;
  final BuildContext context;

  const _CategoryChipsRow({required this.categories, required this.context});

  Color _categoryColor(String name) {
    switch (name) {
      case 'Animals':
        return const Color(0xFF10B981);
      case 'Space':
        return const Color(0xFF3B82F6);
      case 'Nature':
        return const Color(0xFF22C55E);
      case 'Adventures':
        return const Color(0xFFF59E0B);
      case 'Magical World':
        return const Color(0xFFA855F7);
      case 'Fairy Tales':
        return const Color(0xFFEC4899);
      case 'Moral Stories':
        return const Color(0xFF8B5CF6);
      default:
        return const Color(0xFF6366F1);
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final color = _categoryColor(cat.name);
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CategoriesScreen(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: color.withOpacity(0.4), width: 1.2),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(cat.emoji, style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 6),
                  Text(
                    cat.name,
                    style: TextStyle(
                      color: color,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Rhymes horizontal row
// ─────────────────────────────────────────────────────────────────────────────
class _RhymesRow extends StatelessWidget {
  final List<Rhyme> rhymes;

  const _RhymesRow({required this.rhymes});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDark ? const Color(0xFF1E293B) : Colors.white;
    const accentColor = Color(0xFFEC4899); // pink — matches Rhymes screen header

    return SizedBox(
      height: 88,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: rhymes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final rhyme = rhymes[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RhymesScreen()),
            ),
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: accentColor.withOpacity(0.18),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.2 : 0.06),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.music_note_rounded,
                        color: accentColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            rhyme.title,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isDark ? Colors.white : const Color(0xFF1E293B),
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${rhyme.duration} min',
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark
                                  ? Colors.grey.shade500
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
