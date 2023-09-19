import 'package:camera/camera.dart';

class CameraService {
  CameraController? _cameraController;

  CameraController? get cameraController => _cameraController;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _cameraController = CameraController(
        cameras[0],
        ResolutionPreset.medium,
      );
      await _cameraController!.initialize();
    }
  }

  void dispose() {
    _cameraController?.dispose();
  }
}