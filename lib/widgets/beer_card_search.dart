import 'package:beer_connect/models/beer_model.dart';
import 'package:beer_connect/screens/description_screen.dart';
import 'package:beer_connect/utils/beer_type.dart';
import 'package:beer_connect/utils/file_utils.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:beer_connect/widgets/rated_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BeerCardSearch extends StatelessWidget {
  final BeerModel beer;
  const BeerCardSearch({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionScreen(beer: beer) ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        //elevation: 4,
        //color: AppTheme.greyWhite,
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          children: [

            Container(
              //color: AppTheme.greyWhite,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                color: Colors.white
              ),
              height: 120,
              width: 60,
              child: Center(
                child: FutureBuilder<bool>(
                  future: FileUtils.checkIfImageExists(beer.name.toLowerCase()),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final imageExists = snapshot.data ?? false;
                      return Container(
                        height: 100,
                        width: 30,
                        child: imageExists
                            ? Image.asset(
                          'assets/picture/${beer.name.toLowerCase()}.png',
                          height: 100,
                          width: 30,
                          fit: BoxFit.cover,
                        )
                            : SvgPicture.asset(
                          'assets/icon/bottle_icon.svg',
                          color: AppTheme.primaryPurple,
                          height: 80,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                        color: AppTheme.primaryOrange,
                        width: 1.5
                    ),
                  ),
                ),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(bottom: 7)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 20)),
                        Text(
                          beer.name,
                          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 12)),
                        SvgPicture.asset(
                          'assets/icon/glass_icon.svg',
                          height: 15,
                        ),
                        const Padding(padding: EdgeInsets.only(right: 17)),
                        Text(
                          beer.beerType.asString(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 12)),
                        SvgPicture.asset(
                          'assets/icon/flag_icon.svg',
                          height: 13,
                        ),
                        const Padding(padding: EdgeInsets.only(right: 12)),
                        Text(
                          beer.origin,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 10)),
                        SvgPicture.asset(
                          'assets/icon/degree_icon.svg',
                          height: 15,
                        ),
                        const Padding(padding: EdgeInsets.only(right: 15)),
                        Text(
                          '${beer.abv}% vol',
                        )
                      ],
                    )
                  ]
                ),
              )
            ),

            Builder(builder: (context) {
              if (beer.isRated){
                return const RatedFlag();
              } else {
                return Container();
              }
            }),

            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  right: BorderSide(
                      color: AppTheme.primaryOrange,
                      width: 1.5
                  ),
                ),
              ),
              height: 120,
              width: 20,
              child: Center(
                child: Container(
                  height: 40,
                  color: Colors.white,
                  child: Container(
                    //height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                            color: AppTheme.primaryOrange,
                            width: 1.5
                        ),
                        top: BorderSide(
                            color: AppTheme.primaryOrange,
                            width: 1.5
                        ),
                        bottom: BorderSide(
                            color: AppTheme.primaryOrange,
                            width: 1.5
                        ),

                      ),
                    ),
                  ),
                ),
              ),
            ),


            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                  color: Colors.white
              ),
              height: 120,
              width: 60,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(bottom: 30)),
                      Container(
                        height: 8,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                  const Center(
                    child: Text(
                      '75%',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
