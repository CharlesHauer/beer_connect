import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class ButtonScanStroke extends StatelessWidget {
  const ButtonScanStroke({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ElevatedButton(
        onPressed: () {},
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
