import 'package:flutter/material.dart';
import '../data/rhymes_data.dart';
import '../widgets/rhyme_card.dart';
import '../widgets/mini_player.dart';

class RhymesScreen extends StatelessWidget {
  const RhymesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rhymes = RhymesData.getAllRhymes();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    title: const Text('Nursery Rhymes'),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: RhymeCard(rhyme: rhymes[index]),
                        );
                      }, childCount: rhymes.length),
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
