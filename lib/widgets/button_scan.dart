import 'package:flutter/material.dart';

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
          backgroundColor: Colors.yellow,
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
