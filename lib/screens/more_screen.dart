import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/theme_provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String _appVersion = '';

  // ── Feedback email ────────────────────────────────────────────────────────
  static const _feedbackEmail = 'unnatitank14@gmail.com';
  static const _feedbackSubject = 'SleepyTales App Feedback';
  static const _feedbackBody =
      'Hi SleepyTales Team,\n\nHere is my feedback:\n\n'
      '[Please write your feedback here]\n\n'
      'App Version: ';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() => _appVersion = 'v${info.version} (${info.buildNumber})');
    }
  }

  // ────────────────────────────────────────────────────────────────────────────
  // Actions
  // ────────────────────────────────────────────────────────────────────────────

  Future<void> _sendFeedback() async {
    // Always show the feedback bottom sheet — lets user open mail app OR copy email
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Icon(Icons.email_rounded, size: 36, color: Color(0xFF8B5CF6)),
            const SizedBox(height: 12),
            const Text(
              'Send Feedback',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _feedbackEmail,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF6366F1),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open Email App'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  final uri = Uri(
                    scheme: 'mailto',
                    path: _feedbackEmail,
                    queryParameters: {
                      'subject': _feedbackSubject,
                      'body': '$_feedbackBody$_appVersion',
                    },
                  );
                  try {
                    await launchUrl(uri);
                  } catch (_) {
                    // silently fail — user can use the copy button instead
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.copy),
                label: const Text('Copy Email Address'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Clipboard.setData(
                      const ClipboardData(text: _feedbackEmail));
                  _showSnackBar('Email address copied! ✉️');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _shareApp() async {
    await Share.share(
      '🌙 Check out SleepyTales — Bedtime Stories & Lullabies for Kids!\n\n'
      'Beautiful stories, soothing sleep music, and nursery rhymes to help '
      'your little ones drift off peacefully. ✨\n\n'
      '📲 https://play.google.com/store/apps/details?id=com.sleepytales.app',
      subject: 'SleepyTales — Sweet Dreams App',
    );
  }

  Future<void> _rateApp() async {
    final uri = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.sleepytales.app');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showSnackBar('Could not open Play Store. Please search "SleepyTales" on Google Play.');
      }
    } catch (_) {
      _showSnackBar('Could not open Play Store.');
    }
  }

  Future<void> _resetOnboarding() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Replay Introduction?'),
        content: const Text(
            'This will show the welcome screens again next time you open the app.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Yes, Reset')),
        ],
      ),
    );
    if (confirm == true && mounted) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_complete', false);
      if (mounted) {
        _showSnackBar('Introduction will show on next app launch. 👋');
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ── Theme helpers ──────────────────────────────────────────────────────────

  String _themeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:  return 'Light';
      case ThemeMode.dark:   return 'Dark';
      case ThemeMode.system: return 'System default';
    }
  }

  IconData _themeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:  return Icons.light_mode_rounded;
      case ThemeMode.dark:   return Icons.dark_mode_rounded;
      case ThemeMode.system: return Icons.brightness_auto_rounded;
    }
  }

  void _showThemeDialog(ThemeMode current) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text('Choose Theme',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            for (final mode in ThemeMode.values)
              _ThemeOption(
                mode: mode,
                currentMode: current,
                label: _themeLabel(mode),
                icon: _themeIcon(mode),
                onTap: () {
                  themeProvider.setTheme(mode);
                  Navigator.pop(context);
                  _showSnackBar('Theme changed to ${_themeLabel(mode)}');
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.55,
        maxChildSize: 0.85,
        builder: (_, scrollCtrl) => ListView(
          controller: scrollCtrl,
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 40),
          children: [
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text('🌙', style: TextStyle(fontSize: 26)),
                SizedBox(width: 10),
                Text(
                  'About SleepyTales',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              _appVersion.isEmpty ? 'Loading...' : _appVersion,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'SleepyTales is a bedtime companion designed to help children '
              'relax and fall asleep with calming stories, nursery rhymes, '
              'and soothing music.',
              style: TextStyle(height: 1.6, fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              'Features',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),
            for (final f in [
              ('📖', '42 calming bedtime stories'),
              ('🎵', '14 classic nursery rhymes'),
              ('🎤', 'Natural AI narrator'),
              ('💤', 'Sleep timer — auto stops playback'),
              ('🔄', 'Loop mode for continuous play'),
              ('⭐', 'Favourites for quick access'),
              ('📴', '100% offline — no internet needed'),
            ])
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(f.$1, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        f.$2,
                        style: const TextStyle(fontSize: 14, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Privacy Policy'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Data Collection',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 8),
              Text(
                '• Works completely offline\n'
                '• No personal data is collected\n'
                '• No analytics or tracking\n'
                '• All favourites stored locally on your device\n'
                '• No account or sign-in required',
                style: TextStyle(height: 1.6),
              ),
              SizedBox(height: 16),
              Text("Your Child's Safety",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              SizedBox(height: 8),
              Text(
                'SleepyTales contains no ads, no in-app purchases, '
                'and no links that take children outside the app. '
                'It is designed to be a safe, calm space for bedtime.',
                style: TextStyle(height: 1.5),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  void _showSleepTips() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        builder: (_, scrollCtrl) => ListView(
          controller: scrollCtrl,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            Center(
              child: Container(
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('💤  Bedtime Tips',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            for (final tip in _sleepTips)
              _SleepTipCard(number: tip['n']!, title: tip['t']!, body: tip['b']!),
          ],
        ),
      ),
    );
  }

  static const _sleepTips = [
    {
      'n': '1',
      't': 'Keep a consistent bedtime',
      'b': 'Children sleep better with a regular schedule. Aim for the same time every night, even on weekends.',
    },
    {
      'n': '2',
      't': 'Dim the lights 30 minutes before bed',
      'b': 'Bright light suppresses melatonin. Switch to dim warm lights and enable dark mode on the app.',
    },
    {
      'n': '3',
      't': 'Use the sleep timer',
      'b': 'Set a 30–60 minute timer so the app stops automatically. This prevents the device waking your child.',
    },
    {
      'n': '4',
      't': 'Pick calming stories over exciting ones',
      'b': 'Nature, Moral Stories, and Fairy Tales are the calmest categories for winding down.',
    },
    {
      'n': '5',
      't': 'Play sleep music first',
      'b': 'Start with 5–10 minutes of ocean waves or harp music before the story to set a calm mood.',
    },
    {
      'n': '6',
      't': 'No screens after the story ends',
      'b': 'Once the sleep timer stops, resist handing over the device. Let your child drift off naturally.',
    },
  ];

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.themeMode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Gradient header ─────────────────────────────────────────
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
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
                  children: [
                    // App icon
                    Container(
                      width: 80, height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.25), width: 2),
                      ),
                      child: const Icon(Icons.nights_stay_rounded,
                          size: 44, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    const Text('SleepyTales',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const SizedBox(height: 4),
                    Text(
                      _appVersion.isEmpty ? 'Loading...' : _appVersion,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Quick stat chips
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 6,
                      children: const [
                        _StatChip(label: '42 Stories'),
                        _StatChip(label: '14 Rhymes'),
                        _StatChip(label: '100% Offline'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Appearance ───────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: _Section(
                  label: 'Appearance',
                  children: [
                    _Tile(
                      icon: _themeIcon(currentTheme),
                      iconColor: Colors.orange,
                      title: 'App Theme',
                      subtitle: _themeLabel(currentTheme),
                      onTap: () => _showThemeDialog(currentTheme),
                    ),
                  ],
                ),
              ),
            ),

            // ── Feedback & Support ───────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _Section(
                  label: 'Feedback & Support',
                  children: [
                    _Tile(
                      icon: Icons.email_rounded,
                      iconColor: const Color(0xFF8B5CF6),
                      title: 'Send Feedback',
                      subtitle: _feedbackEmail,
                      onTap: _sendFeedback,
                    ),
                    _Tile(
                      icon: Icons.share_rounded,
                      iconColor: Colors.green,
                      title: 'Share App',
                      subtitle: 'Tell your friends about SleepyTales',
                      onTap: _shareApp,
                    ),
                    _Tile(
                      icon: Icons.star_rounded,
                      iconColor: Colors.amber,
                      title: 'Rate on Play Store',
                      subtitle: 'Love the app? Leave us a ⭐ review!',
                      onTap: _rateApp,
                    ),
                  ],
                ),
              ),
            ),

            // ── Bedtime Tips ─────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _Section(
                  label: 'Sleep Well',
                  children: [
                    _Tile(
                      icon: Icons.tips_and_updates_rounded,
                      iconColor: const Color(0xFF06B6D4),
                      title: 'Bedtime Tips',
                      subtitle: '6 expert tips for a peaceful sleep routine',
                      onTap: _showSleepTips,
                    ),
                    _Tile(
                      icon: Icons.replay_rounded,
                      iconColor: Colors.blueGrey,
                      title: 'Replay Introduction',
                      subtitle: 'Show the welcome screens again',
                      onTap: _resetOnboarding,
                    ),
                  ],
                ),
              ),
            ),

            // ── About ────────────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _Section(
                  label: 'About',
                  children: [
                    _Tile(
                      icon: Icons.privacy_tip_rounded,
                      iconColor: Colors.teal,
                      title: 'Privacy Policy',
                      subtitle: 'No data collected. 100% offline.',
                      onTap: _showPrivacyDialog,
                    ),
                    _Tile(
                      icon: Icons.info_rounded,
                      iconColor: const Color(0xFF6366F1),
                      title: 'About SleepyTales',
                      subtitle: _appVersion.isEmpty ? 'Loading...' : _appVersion,
                      onTap: _showAboutDialog,
                    ),
                  ],
                ),
              ),
            ),

            // ── Footer disclaimer ────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.bedtime_rounded,
                          color: Color(0xFF6366F1), size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'SleepyTales helps children relax and fall asleep '
                          'with calming stories, rhymes, and soothing music. '
                          'Sweet dreams! 🌙',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Made with love ───────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Center(
                  child: Text(
                    'Made with ❤️ for sweet dreams',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? Colors.grey.shade600
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Reusable section card
// ─────────────────────────────────────────────────────────────────────────────
class _Section extends StatelessWidget {
  final String label;
  final List<Widget> children;

  const _Section({required this.label, required this.children});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.2 : 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: List.generate(children.length, (i) {
              return Column(
                children: [
                  children[i],
                  if (i < children.length - 1)
                    Divider(
                      height: 1,
                      indent: 56,
                      endIndent: 16,
                      color: Colors.grey.withOpacity(0.15),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual tile row
// ─────────────────────────────────────────────────────────────────────────────
class _Tile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _Tile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 21),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey.shade500
              : Colors.grey.shade500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded,
          size: 20, color: Colors.grey),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Theme option tile in bottom sheet
// ─────────────────────────────────────────────────────────────────────────────
class _ThemeOption extends StatelessWidget {
  final ThemeMode mode;
  final ThemeMode currentMode;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.mode,
    required this.currentMode,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = mode == currentMode;
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xFF6366F1) : Colors.grey,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? const Color(0xFF6366F1) : null,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle_rounded,
              color: Color(0xFF6366F1), size: 22)
          : null,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Header stat chip
// ─────────────────────────────────────────────────────────────────────────────
class _StatChip extends StatelessWidget {
  final String label;
  const _StatChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Sleep tip card
// ─────────────────────────────────────────────────────────────────────────────
class _SleepTipCard extends StatelessWidget {
  final String number;
  final String title;
  final String body;

  const _SleepTipCard({
    required this.number,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFF6366F1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(body,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                      height: 1.4,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
