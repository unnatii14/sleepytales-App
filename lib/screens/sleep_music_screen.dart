import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/sleep_music_data.dart';
import '../models/sleep_music.dart';
import '../providers/audio_player_provider.dart';
import '../widgets/mini_player.dart';

class SleepMusicScreen extends StatefulWidget {
  const SleepMusicScreen({super.key});

  @override
  State<SleepMusicScreen> createState() => _SleepMusicScreenState();
}

class _SleepMusicScreenState extends State<SleepMusicScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<String> _categories;

  @override
  void initState() {
    super.initState();
    _categories = SleepMusicData.getCategories();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            _SleepMusicHeader(isDark: isDark),

            // ── Category tabs ────────────────────────────────────────────
            Container(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: const Color(0xFF6366F1),
                indicatorWeight: 3,
                labelColor: const Color(0xFF6366F1),
                unselectedLabelColor: const Color(0xFF94A3B8),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                tabs: _categories.map((c) => Tab(text: c)).toList(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),

            // ── Content ───────────────────────────────────────────────────
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _categories.map((category) {
                  final music = SleepMusicData.getMusicByCategory(category);
                  return _MusicList(music: music);
                }).toList(),
              ),
            ),

            // ── Mini Player ───────────────────────────────────────────────
            const MiniPlayer(),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────────
class _SleepMusicHeader extends StatelessWidget {
  final bool isDark;
  const _SleepMusicHeader({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF1E1B4B), const Color(0xFF0F172A)]
              : [const Color(0xFF4F46E5), const Color(0xFF818CF8)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.music_note_rounded,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Sleep Music',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Calming sounds to help drift into peaceful sleep 🌙',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white.withOpacity(0.85),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Quick-tip chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                _TipChip(icon: Icons.loop, label: 'Loop any track'),
                SizedBox(width: 8),
                _TipChip(icon: Icons.timer_outlined, label: 'Set sleep timer'),
                SizedBox(width: 8),
                _TipChip(icon: Icons.offline_bolt, label: '100% Offline'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TipChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _TipChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Music list for each tab
// ─────────────────────────────────────────────────────────────────────────────
class _MusicList extends StatelessWidget {
  final List<SleepMusic> music;
  const _MusicList({required this.music});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: music.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: _MusicCard(music: music[index]),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual music card with cover art
// ─────────────────────────────────────────────────────────────────────────────
class _MusicCard extends StatelessWidget {
  final SleepMusic music;
  const _MusicCard({required this.music});

  static const _categoryColors = {
    'Lullabies': Color(0xFF8B5CF6),
    'Nature Sounds': Color(0xFF10B981),
    'Ambient': Color(0xFF3B82F6),
  };

  IconData _categoryIcon(String cat) {
    switch (cat) {
      case 'Nature Sounds':
        return Icons.forest_rounded;
      case 'Ambient':
        return Icons.waves_rounded;
      case 'Lullabies':
      default:
        return Icons.piano_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColors[music.category] ?? const Color(0xFF6366F1);

    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, _) {
        final isCurrent = audioProvider.currentAudioUrl == music.audioUrl;
        final isPlaying = isCurrent && audioProvider.isPlaying;
        final isLoading = isCurrent && audioProvider.isLoading;

        return GestureDetector(
          onTap: () async {
            await audioProvider.playAudio(music.audioUrl, music.title);
            if (audioProvider.errorMessage != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(child: Text(audioProvider.errorMessage!)),
                    ],
                  ),
                  backgroundColor: const Color(0xFFEF4444),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 4),
                ),
              );
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: isCurrent
                  ? Border.all(color: color, width: 2)
                  : Border.all(color: Colors.transparent, width: 2),
              boxShadow: [
                BoxShadow(
                  color: isCurrent
                      ? color.withOpacity(0.25)
                      : Colors.black.withOpacity(0.15),
                  blurRadius: isCurrent ? 16 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Cover image
                  SizedBox(
                    height: 110,
                    width: double.infinity,
                    child: Image.asset(
                      music.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: color.withOpacity(0.3),
                        child: Icon(_categoryIcon(music.category),
                            size: 48, color: color),
                      ),
                    ),
                  ),
                  // Dark overlay for readability
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.black.withOpacity(0.75),
                          Colors.black.withOpacity(0.35),
                        ],
                      ),
                    ),
                  ),
                  // Content row
                  SizedBox(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      child: Row(
                        children: [
                          // Play/pause button
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: isCurrent
                                  ? color
                                  : Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: isLoading
                                ? const Padding(
                                    padding: EdgeInsets.all(14),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Icon(
                                    isPlaying
                                        ? Icons.pause_rounded
                                        : Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                          ),
                          const SizedBox(width: 14),
                          // Text info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  music.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  music.description,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: 12,
                                    height: 1.3,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: color.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(_categoryIcon(music.category),
                                              size: 11, color: color),
                                          const SizedBox(width: 4),
                                          Text(
                                            music.category,
                                            style: TextStyle(
                                              color: color,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(Icons.access_time,
                                        size: 11,
                                        color: Colors.white.withOpacity(0.6)),
                                    const SizedBox(width: 3),
                                    Text(
                                      '${music.duration} min',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Now playing pulse indicator
                          if (isPlaying) ...[
                            const SizedBox(width: 8),
                            _PulsingDot(color: color),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated pulsing dot for "now playing"
// ─────────────────────────────────────────────────────────────────────────────
class _PulsingDot extends StatefulWidget {
  final Color color;
  const _PulsingDot({required this.color});

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
