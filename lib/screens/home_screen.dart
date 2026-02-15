import 'package:flutter/material.dart';
import '../data/stories_data.dart';
import '../widgets/story_card.dart';
import '../widgets/mini_player.dart';
import '../widgets/story_search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredStories = StoriesData.getFeaturedStories();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // App Bar
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.nights_stay,
                                size: 32,
                                color: Color(0xFF6366F1),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'SleepyTales',
                                style: Theme.of(
                                  context,
                                ).textTheme.displayMedium,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  size: 28,
                                  color: Color(0xFFCBD5E1),
                                ),
                                onPressed: () {
                                  showSearch(
                                    context: context,
                                    delegate: StorySearchDelegate(),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Good Night! 🌟',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(color: const Color(0xFFCBD5E1)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Featured Stories Section
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text('⭐', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Text(
                            'Featured Stories',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return StoryCard(story: featuredStories[index]);
                      }, childCount: featuredStories.length),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
            ),
            const MiniPlayer(),
          ],
        ),
      ),
    );
  }
}
