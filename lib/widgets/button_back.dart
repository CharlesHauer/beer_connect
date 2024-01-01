
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {Navigator.of(context).pop();},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          size: 30,
          color: AppTheme.greyBlack,
        ),
      ),
    );
  }
}
