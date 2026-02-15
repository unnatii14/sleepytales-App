import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/stories_data.dart';
import '../widgets/story_card.dart';
import '../widgets/mini_player.dart';

class CategoryStoriesScreen extends StatelessWidget {
  final StoryCategory category;

  const CategoryStoriesScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final stories = StoriesData.getStoriesByCategory(category.id);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    title: Row(
                      children: [
                        Text(category.emoji),
                        const SizedBox(width: 8),
                        Text(category.name),
                      ],
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        category.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),

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
                        return StoryCard(story: stories[index]);
                      }, childCount: stories.length),
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
