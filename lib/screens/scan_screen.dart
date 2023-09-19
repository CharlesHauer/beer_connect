import 'package:beer_connect/widgets/button_search.dart';
import 'package:beer_connect/widgets/button_setting.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../services/camera_service.dart';

class ScanScreen extends StatefulWidget {

  const ScanScreen({super.key});
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late CameraService _cameraService;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _cameraService = CameraService();
    _initCamera();
  }

  Future<void> _initCamera() async {
    await _cameraService.initializeCamera();
    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _cameraService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: size.height,
            child: CameraPreview(_cameraService.cameraController!),
          ),
          const Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonSearch(),
                    ButtonSetting(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}