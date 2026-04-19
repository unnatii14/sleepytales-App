import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/main_screen.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Onboarding data
// ─────────────────────────────────────────────────────────────────────────────
class _OnboardingPage {
  final String emoji;
  final String title;
  final String subtitle;
  final List<Color> gradientColors;
  final List<_FeatureItem> features;

  const _OnboardingPage({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.gradientColors,
    required this.features,
  });
}

class _FeatureItem {
  final IconData icon;
  final String text;
  const _FeatureItem(this.icon, this.text);
}

const _pages = [
  _OnboardingPage(
    emoji: '🌙',
    title: 'Welcome to\nSleepyTales',
    subtitle: 'The bedtime companion your child will love every single night',
    gradientColors: [Color(0xFF1E1B4B), Color(0xFF312E81)],
    features: [
      _FeatureItem(Icons.menu_book_rounded, '42 enchanting bedtime stories'),
      _FeatureItem(Icons.music_note_rounded, '14 classic nursery rhymes'),
      _FeatureItem(Icons.nights_stay_rounded, '9 calming sleep music tracks'),
    ],
  ),
  _OnboardingPage(
    emoji: '📖',
    title: 'Stories for\nEvery Night',
    subtitle: 'From fairy tales to moral stories — curated for peaceful sleep',
    gradientColors: [Color(0xFF1E3A5F), Color(0xFF0F172A)],
    features: [
      _FeatureItem(Icons.category_rounded, '7 beautifully crafted categories'),
      _FeatureItem(Icons.record_voice_over_rounded, 'Natural AI narration built-in'),
      _FeatureItem(Icons.favorite_rounded, 'Save your child\'s favourites'),
    ],
  ),
  _OnboardingPage(
    emoji: '😴',
    title: 'Sleep Better\nTonight',
    subtitle: 'Smart tools to build a healthy, calming bedtime routine',
    gradientColors: [Color(0xFF1A1040), Color(0xFF0F172A)],
    features: [
      _FeatureItem(Icons.timer_rounded, 'Sleep timer — auto stops playback'),
      _FeatureItem(Icons.wifi_off_rounded, '100% offline — no internet needed'),
      _FeatureItem(Icons.dark_mode_rounded, 'Dark mode for comfortable viewing'),
    ],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// Main onboarding screen
// ─────────────────────────────────────────────────────────────────────────────
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String _prefKey = 'onboarding_complete';

  /// Call this to check if onboarding has been seen before.
  static Future<bool> hasBeenSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefKey) ?? false;
  }

  /// Mark onboarding as complete so it won't show again.
  static Future<void> markComplete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, true);
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _goToMain() async {
    await OnboardingScreen.markComplete();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainScreen(),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToMain();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentPage == _pages.length - 1;
    final page = _pages[_currentPage];

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: page.gradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ── Skip button ─────────────────────────────────────────────
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
                  child: AnimatedOpacity(
                    opacity: isLast ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: TextButton(
                      onPressed: isLast ? null : _goToMain,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ── Page content ─────────────────────────────────────────────
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemCount: _pages.length,
                  itemBuilder: (_, index) =>
                      _PageContent(page: _pages[index]),
                ),
              ),

              // ── Dots + buttons ────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
                child: Column(
                  children: [
                    // Dot indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == i ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == i
                                ? Colors.white
                                : Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Primary action button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: ElevatedButton(
                          key: ValueKey(isLast),
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isLast
                                ? const Color(0xFF6366F1)
                                : Colors.white,
                            foregroundColor: isLast
                                ? Colors.white
                                : const Color(0xFF1E1B4B),
                            elevation: isLast ? 8 : 4,
                            shadowColor: isLast
                                ? const Color(0xFF6366F1).withOpacity(0.5)
                                : Colors.black26,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isLast ? 'Start Exploring 🌙' : 'Next',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              if (!isLast) ...[
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward_rounded,
                                    size: 18),
                              ],
                            ],
                          ),
                        ),
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
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Individual page content
// ─────────────────────────────────────────────────────────────────────────────
class _PageContent extends StatefulWidget {
  final _OnboardingPage page;
  const _PageContent({required this.page});

  @override
  State<_PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<_PageContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scaleAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnim = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Large emoji with scale bounce
          ScaleTransition(
            scale: _scaleAnim,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  widget.page.emoji,
                  style: const TextStyle(fontSize: 56),
                ),
              ),
            ),
          ),

          const SizedBox(height: 36),

          // Title + subtitle with slide-up fade
          FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Column(
                children: [
                  Text(
                    widget.page.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.15,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    widget.page.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.75),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 36),

          // Feature list
          FadeTransition(
            opacity: _fadeAnim,
            child: Column(
              children: widget.page.features
                  .map((f) => _FeatureRow(item: f))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Feature row inside each slide
// ─────────────────────────────────────────────────────────────────────────────
class _FeatureRow extends StatelessWidget {
  final _FeatureItem item;
  const _FeatureRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              item.text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
