import 'package:beer_connect/screens/scan_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ScanScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'historique'),
          BottomNavigationBarItem(icon: Icon(Icons.document_scanner_outlined), label: 'scan'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'aide'),
        ],
      ),
    );
  }
}

