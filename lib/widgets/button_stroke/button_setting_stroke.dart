import 'package:beer_connect/utils/theme.dart';
import 'package:flutter/material.dart';

class ButtonSettingStroke extends StatelessWidget {
  const ButtonSettingStroke({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
          side: const BorderSide(color: AppTheme.greyBlack, width: 1.5),
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