import 'package:beer_connect/screens/suggest_screen.dart';
import 'package:beer_connect/screens/scan_screen.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HistoryScreen(),
        const ScanScreen(),
        const SuggestScreen(),
      ][_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryYellow,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: AppTheme.greyBlack.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppTheme.greyBlack,
              iconSize: 35,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              color: AppTheme.greyBlack,
              tabs: const [
                GButton(
                  icon: LineIcons.history,
                  text: 'HISTORIQUE',
                ),
                GButton(
                  icon: IconData(0xefe1, fontFamily: 'MaterialIcons'),
                  text: 'SCAN',
                ),
                GButton(
                  icon: IconData(0xe25b, fontFamily: 'MaterialIcons', matchTextDirection: true),
                  text: 'SUGGESTION',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
