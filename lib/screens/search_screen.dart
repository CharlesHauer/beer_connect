import 'package:beer_connect/models/beer_model.dart';
import 'package:beer_connect/utils/beer_type.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:beer_connect/widgets/beer_card_search.dart';
import 'package:beer_connect/widgets/button_back.dart';
import 'package:beer_connect/widgets/button_setting.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeerModel beer = BeerModel(
      id: 1,
      abv: 12.5,
      beerType: BeerType.blonde,
      description: 'description',
      isRated: true,
      name: 'Leffe',
      origin: 'Belgique',
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: AppTheme.primaryOrange, width: 1.5),
                  ),
                  color: AppTheme.greyWhite),
              height: 60,
              child: const Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),
                  ButtonBack(),
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Padding(padding: EdgeInsets.only(right: 10)),
                          Text(
                            'RECHERCHE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonSetting(),
                  Padding(padding: EdgeInsets.only(right: 10)),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.settings_input_component)),
                  hintText: 'nom',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  BeerCardSearch(
                    beer: beer,
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 30)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
