import 'package:beer_connect/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonSetting extends StatelessWidget {
  const ButtonSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
        ),
        child: const Icon(
          Icons.settings,
          size: 30,
          color: AppTheme.greyBlack,
        ),
      ),
    );
  }
}