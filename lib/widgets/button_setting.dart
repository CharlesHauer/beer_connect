import 'package:flutter/material.dart';

class ButtonSetting extends StatelessWidget {
  const ButtonSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.yellow,
        side: const BorderSide(color: Colors.black, width: 1.5),
      ),
      child: const Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}