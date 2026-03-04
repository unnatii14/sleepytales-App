import 'package:flutter/material.dart';
import '../data/sleep_music_data.dart';
import '../widgets/sleep_music_card.dart';
import '../widgets/mini_player.dart';

class SleepMusicScreen extends StatelessWidget {
  const SleepMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final music = SleepMusicData.getAllMusic();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    title: const Text('Sleep Music'),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Calming sounds to help you drift into peaceful sleep',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SleepMusicCard(music: music[index]),
                        ),
                        childCount: music.length,
                      ),
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
