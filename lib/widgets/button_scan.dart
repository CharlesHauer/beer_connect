import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ButtonScan extends StatelessWidget {
  const ButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
          side: const BorderSide(color: Colors.black, width: 3.5),
        ),
        child: const Icon(
          Icons.document_scanner_outlined,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
