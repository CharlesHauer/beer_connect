import 'package:camera/camera.dart';

class CameraService {
  CameraController? _cameraController;
  late Future<void> _initializeControllerFuture;

  CameraController? get cameraController => _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.max,
      );
      _initializeControllerFuture = _cameraController!.initialize();
      await _initializeControllerFuture;
    }
  }

  void dispose() {
    _cameraController?.dispose();
  }
}