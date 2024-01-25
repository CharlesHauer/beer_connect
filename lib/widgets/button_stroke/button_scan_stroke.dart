import 'package:beer_connect/screens/show_scan_screen.dart';
import 'package:flutter/material.dart';
import '../../services/camera_service.dart';
import '../../utils/theme.dart';

class ButtonScanStroke extends StatelessWidget {
  final CameraService _cameraService;

  const ButtonScanStroke({
    Key? key,
    required CameraService cameraService,
  })   : _cameraService = cameraService,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final localContext = context;
    return SizedBox(
      height: 160,
      child: ElevatedButton(
        onPressed: () async {
          try {
            final image = await _cameraService.cameraController!.takePicture();
            Navigator.push(localContext, MaterialPageRoute(builder: (context) => ShowScanScreen(imagePath: image.path)));
          } catch (e) {
            print(e);
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
          side: const BorderSide(color: AppTheme.greyBlack, width: 3),
        ),
        child: const Icon(
          Icons.document_scanner_outlined,
          size: 50,
          color: AppTheme.greyBlack,
        ),
      ),
    );
  }
}
