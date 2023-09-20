import 'package:beer_connect/screens/help_screen.dart';
import 'package:beer_connect/screens/scan_screen.dart';
import 'package:flutter/material.dart';

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
        const HelpScreen(),
      ][_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) =>  setCurrentIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'historique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            label: 'scan'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'aide',
          ),
        ],
      ),
    );
  }
}

