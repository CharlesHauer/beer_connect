import 'package:beer_connect/models/beer_model.dart';
import 'package:beer_connect/utils/beer_type.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:beer_connect/widgets/rated_flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BeerCardSearch extends StatelessWidget {
  final BeerModel beer;
  const BeerCardSearch({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      color: AppTheme.greyWhite,
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: Row(
        children: [

          Container(
            //color: AppTheme.greyWhite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
              color: AppTheme.greyWhite
            ),
            height: 120,
            width: 60,
            child: Center(
              child: SvgPicture.asset(
                'assets/icon/bottle_icon.svg',
                color: AppTheme.primaryPurple,
                height: 80,
              ),
            ),
          ),

          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.greyWhite,
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
              color: AppTheme.greyWhite,
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
                color: AppTheme.greyWhite,
                child: Container(
                  //height: 40,
                  decoration: const BoxDecoration(
                    color: AppTheme.greyWhite,
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
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                color: AppTheme.greyWhite
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
    );
  }
}
