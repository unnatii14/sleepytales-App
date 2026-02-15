import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/home_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/rhymes_screen.dart';
import '../screens/favorites_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // Lazy-load screens instead of creating all at once
  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return const RhymesScreen();
      case 3:
        return const FavoritesScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(_currentIndex),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.house),
            selectedIcon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.tableCellsLarge),
            selectedIcon: FaIcon(FontAwesomeIcons.tableCellsLarge),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.music),
            selectedIcon: FaIcon(FontAwesomeIcons.music),
            label: 'Rhymes',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.heart),
            selectedIcon: FaIcon(FontAwesomeIcons.solidHeart),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
