import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/story_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            final favoriteStories = favoritesProvider.getFavoriteStories();

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  title: Text('Favorites (${favoriteStories.length})'),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),

                if (favoriteStories.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.heart,
                            size: 64,
                            color: Color(0xFF475569),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'No Favorites Yet',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Start adding your favorite stories!',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: const Color(0xFF94A3B8)),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return StoryCard(story: favoriteStories[index]);
                      }, childCount: favoriteStories.length),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
