
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {Navigator.of(context).pop();},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
          side: const BorderSide(color: AppTheme.greyBlack, width: 1.5),
        ),
        child: const Icon(
          Icons.arrow_back_rounded,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
