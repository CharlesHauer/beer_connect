import 'package:beer_connect/models/beer_model.dart';
import 'package:beer_connect/utils/beer_type.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:beer_connect/widgets/beer_card_search.dart';
import 'package:beer_connect/widgets/button_back.dart';
import 'package:beer_connect/widgets/button_setting.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Padding(padding: EdgeInsets.only(bottom: 5)),

            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('beer_collection').orderBy('Name').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  return ListView(
                    padding: const EdgeInsets.all(10),
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      return BeerCardSearch(
                        beer: BeerModel(
                            name: data['Name'].toString(),
                            beerType: BeerTypeExtension.fromString(data['BeerType']),
                            origin: data['Origin'],
                            abv: double.parse(data['Abv'].toString()),
                            isRated: data['IsRated'],
                            description: data['Description']
                        ),
                      );
                    }).toList(),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
