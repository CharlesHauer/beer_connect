import 'package:flutter/material.dart';

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.yellow,
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: const Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
