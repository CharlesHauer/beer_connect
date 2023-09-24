import 'package:beer_connect/widgets/button_back.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonBack(),
              ],
            ),
            Center(
              child: Text('search Screen incoming'),
            )
          ],
        ),
      ),
    );
  }
}
