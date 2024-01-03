import 'package:beer_connect/app_routes.dart';
import 'package:beer_connect/screens/home_screen.dart';
import 'package:beer_connect/screens/search_screen.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> setupCameras() async {
  await availableCameras();
}


Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppTheme.primaryYellow,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.search: (context) => const SearchScreen(),
      },
    );
  }
}