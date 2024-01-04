import 'package:beer_connect/models/beer_model.dart';
import 'package:beer_connect/utils/beer_type.dart';
import 'package:beer_connect/utils/file_utils.dart';
import 'package:beer_connect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widgets/button_back.dart';
import '../widgets/button_setting.dart';
import '../widgets/rated_flag.dart';

class DescriptionScreen extends StatelessWidget {
  final BeerModel beer;
  const DescriptionScreen({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 160)),
                SizedBox(
                  width: screenWidth,
                  child: SvgPicture.asset('assets/background/back_description.svg', width: screenWidth,),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(80, 80),
              child: FutureBuilder<bool>(
                future: FileUtils.checkIfImageExists(beer.name.toLowerCase()),
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final imageExists = snapshot.data ?? false;
                    return SizedBox(
                      height: 200,
                      width: 60,
                      child: imageExists
                          ? Image.asset(
                        'assets/picture/${beer.name.toLowerCase()}.png',
                        height: 200,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                          : SvgPicture.asset(
                        'assets/icon/bottle_icon.svg',
                        color: AppTheme.primaryPurple,
                        height: 70,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),

            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 90)),
                Row(
                  children: [
                    Expanded(child: Container()),
                    CircularPercentIndicator(
                      radius: 65.0,
                      lineWidth: 12.5,
                      percent: 0.75,
                      animation: true,
                      center: const Text("75%", style: TextStyle(fontWeight: FontWeight.bold),),
                      progressColor: AppTheme.primaryYellow,
                      backgroundColor: Colors.transparent,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    const Padding(padding: EdgeInsets.only(right: 50)),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 80)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Builder(builder: (context) {
                      if (beer.isRated){
                        return const Icon(Icons.rate_review, color: AppTheme.primaryPurple,);
                      } else {
                        return Container();
                      }
                    }),
                    const Padding(padding: EdgeInsets.only(left: 20)),
                  ],
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom:
                        BorderSide(color: AppTheme.primaryOrange, width: 1.5),
                    ),
                    color: AppTheme.greyWhite
                  ),
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
                              Icon(Icons.description),
                              Padding(padding: EdgeInsets.only(right: 10)),
                              Text(
                                'DESCRIPTION',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ButtonSetting(),
                      Padding(padding: EdgeInsets.only(right: 10)),
                    ],
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 240)),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: AppTheme.greyWhite,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ]
                          ),
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Row(
                                children: [
                                  const Padding(padding: EdgeInsets.only(right: 40)),
                                  Text(beer.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                                        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryPurple),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                      elevation: MaterialStateProperty.resolveWith<double>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.pressed)) return 10;
                                            return 5;
                                          },
                                        ),
                                      ),
                                      child: const Icon(Icons.share_outlined, color: AppTheme.greyWhite,),
                                    ),
                                  ),
                                  const Padding(padding: EdgeInsets.only(right: 40)),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                width: screenWidth - 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppTheme.primaryOrange
                                  )
                                ),
                                margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                                child: Column(
                                  children: [
                                    const Padding(padding: EdgeInsets.only(top: 25)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            SvgPicture.asset(
                                              'assets/icon/glass_icon.svg',
                                              height: 15,
                                            ),
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            Text(
                                              beer.beerType.asString(),
                                              style: const TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            SvgPicture.asset(
                                              'assets/icon/flag_icon.svg',
                                              height: 15,
                                            ),
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            Text(
                                              beer.origin,
                                              style: const TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            SvgPicture.asset(
                                              'assets/icon/degree_icon.svg',
                                              height: 15,
                                            ),
                                            const Padding(padding: EdgeInsets.only(right: 12)),
                                            Text(
                                              '${beer.abv}% vol',
                                              style: const TextStyle(fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const Padding(padding: EdgeInsets.only(top: 30)),
                                    const Row(
                                      children: [
                                        Padding(padding: EdgeInsets.only(right: 40)),
                                        Text(
                                          'Description',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text(
                                        beer.description,
                                        style: const TextStyle(fontSize: 15),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 30)),
                              const Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 40)),
                                  Text(
                                    'Badges',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                width: screenWidth - 40,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppTheme.primaryOrange
                                    )
                                ),
                                child: const Center(child: Text('Bages incoming')),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 30)),
                              const Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 40)),
                                  Text(
                                    'Similaire',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                width: screenWidth - 40,
                                height: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: AppTheme.primaryOrange
                                    )
                                ),
                                child: const Center(child: Text('Similaire incoming')),
                              ),

                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.restart_alt, color: AppTheme.primaryPurple, size: 40,),
                                  ),

                                  CircularPercentIndicator(
                                    radius: 55.0,
                                    lineWidth: 10,
                                    percent: 0.75,
                                    animation: true,
                                    center: const Text("75%", style: TextStyle(fontWeight: FontWeight.bold),),
                                    progressColor: AppTheme.primaryYellow,
                                    backgroundColor: Colors.transparent,
                                    circularStrokeCap: CircularStrokeCap.round,
                                  ),

                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.rate_review_outlined, color: AppTheme.primaryPurple, size: 40,),
                                  ),
                                ],
                              ),

                              const Padding(padding: EdgeInsets.only(top: 30)),

                              Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.primaryPurple,
                                    minimumSize: Size(200, 55),
                                  ),
                                  child: const Text('CHOISIR', style: TextStyle(color: AppTheme.greyWhite, fontSize: 25, fontWeight: FontWeight.bold),),
                                ),
                              ),

                              Container(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }

}
