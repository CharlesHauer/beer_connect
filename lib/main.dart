import 'package:beer_connect/screens/home_screen.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<void> setupCameras() async {
  await availableCameras();
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryYellow,),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}