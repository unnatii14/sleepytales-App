import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/theme_provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String _appVersion = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = 'v${info.version} (${info.buildNumber})';
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.themeMode;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          children: [
            // App Header
            _buildAppHeader(),
            const SizedBox(height: 28),

            // Appearance Section
            _buildSectionCard(
              title: 'Appearance',
              items: [
                _buildActionTile(
                  icon: Icons.brightness_6,
                  iconColor: Colors.orange,
                  title: 'App Theme',
                  subtitle: _getThemeText(currentTheme),
                  onTap: () => _showThemeDialog(currentTheme),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Feedback & Support Section
            _buildSectionCard(
              title: 'Feedback & Support',
              items: [
                _buildActionTile(
                  icon: Icons.share,
                  iconColor: Colors.green,
                  title: 'Share App',
                  subtitle: 'Tell your friends',
                  onTap: _shareApp,
                ),
                _buildActionTile(
                  icon: Icons.feedback,
                  iconColor: Colors.purple,
                  title: 'Send Feedback',
                  subtitle: 'Help us improve',
                  onTap: _sendFeedback,
                ),
                _buildActionTile(
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  title: 'Rate SleepyTales',
                  subtitle: 'Love the app? Leave a review!',
                  onTap: _rateApp,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // About Section
            _buildSectionCard(
              title: 'About',
              items: [
                _buildActionTile(
                  icon: Icons.privacy_tip_outlined,
                  iconColor: Colors.grey,
                  title: 'Privacy Policy',
                  subtitle: 'How we handle your data',
                  onTap: _showPrivacyInfo,
                ),
                _buildActionTile(
                  icon: Icons.info_outline,
                  iconColor: Colors.indigo,
                  title: 'About App',
                  subtitle: 'Version $_appVersion',
                  onTap: _showAppInfo,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Disclaimer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF6366F1).withOpacity(0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.bedtime, color: const Color(0xFF6366F1), size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'SleepyTales helps children relax and fall asleep with calming stories, rhymes, and soothing music. Sweet dreams! 🌙',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAppHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6366F1).withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Icon(Icons.bedtime, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          const Text(
            'SleepyTales',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            _appVersion,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 13)),
      trailing: const Icon(Icons.chevron_right, size: 20),
    );
  }

  String _getThemeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System default';
    }
  }

  void _showThemeDialog(ThemeMode currentTheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildThemeOption('System default', ThemeMode.system, currentTheme),
            _buildThemeOption('Light', ThemeMode.light, currentTheme),
            _buildThemeOption('Dark', ThemeMode.dark, currentTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    String title,
    ThemeMode mode,
    ThemeMode currentTheme,
  ) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return RadioListTile<ThemeMode>(
      title: Text(title),
      value: mode,
      groupValue: currentTheme,
      activeColor: const Color(0xFF6366F1),
      onChanged: (ThemeMode? value) {
        if (value != null) {
          themeProvider.setTheme(value);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Theme changed to $title'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }

  Future<void> _shareApp() async {
    await Share.share(
      'Check out SleepyTales - Bedtime Stories & Lullabies for Kids! '
      'Beautiful stories, calming music, and nursery rhymes to help your little ones drift off to sleep. 🌙✨\n\n'
      '📲 Download: https://play.google.com/store/apps/details?id=com.sleepytales.app',
      subject: 'SleepyTales App',
    );
  }

  Future<void> _sendFeedback() async {
    const email = 'feedback@sleepytales.app';
    const subject = 'SleepyTales Feedback';
    final uri = Uri(scheme: 'mailto', path: email, query: 'subject=$subject');

    try {
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Please send feedback to: feedback@sleepytales.app',
              ),
              duration: Duration(seconds: 4),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please send feedback to: feedback@sleepytales.app'),
            duration: Duration(seconds: 4),
          ),
        );
      }
    }
  }

  Future<void> _rateApp() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.sleepytales.app';
    final uri = Uri.parse(url);

    try {
      final canLaunch = await canLaunchUrl(uri);
      if (canLaunch) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open Play Store'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open Play Store'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  void _showAppInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About SleepyTales'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Version: $_appVersion',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'SleepyTales is a bedtime companion app designed to help children relax and fall asleep peacefully.',
                style: TextStyle(height: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'Features:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('🌙 45+ calming bedtime stories'),
              const Text('🎵 Soothing sleep music & lullabies'),
              const Text('🎤 AI narrator with customizable voice'),
              const Text('💤 Sleep timer for peaceful rest'),
              const Text('🔄 Loop mode for continuous play'),
              const Text('⭐ Favorites for quick access'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Data Collection',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '• This app works completely offline\n'
                '• No personal data is collected\n'
                '• No analytics or tracking\n'
                '• All data stays on your device',
              ),
              const SizedBox(height: 16),
              const Text(
                'Your Privacy Matters',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'We respect your privacy and your child\'s safety. SleepyTales is designed to work completely offline without collecting any personal information.',
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
}
