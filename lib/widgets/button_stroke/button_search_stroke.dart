
import 'package:beer_connect/route_builders/page_route_search.dart';
import 'package:beer_connect/screens/search_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/theme.dart';

class ButtonSearchStroke extends StatelessWidget {
  const ButtonSearchStroke({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {Navigator.of(context).push(PageRouteSearch(page: const SearchScreen()));},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppTheme.primaryYellow,
          side: const BorderSide(color: AppTheme.greyBlack, width: 1.5),
        ),
        child: const Icon(
          Icons.search,
          size: 30,
          color: AppTheme.greyBlack,
        ),
      ),
    );
  }
}
