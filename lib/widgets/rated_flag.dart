import 'package:beer_connect/utils/theme.dart';
import 'package:flutter/material.dart';

class RatedFlag extends StatelessWidget {
  const RatedFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 120,
      child: const Row(
        children: [
          Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 7)),
              Icon(Icons.rate_review, color: AppTheme.primaryPurple,),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 12)),
        ],
      ),
    );
  }
}
