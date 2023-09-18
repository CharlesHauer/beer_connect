import 'package:beer_connect/screens/ScanScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

Future<List<CameraDescription>> setupCameras() async {
  List<CameraDescription> cameras;
  cameras = await availableCameras();
  return cameras;
}


Future<void> main() async {
  List<CameraDescription> cameras;
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await setupCameras();
  runApp(MyApp(cameras: cameras,));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScanScreen(cameras: cameras,),
    );
  }
}