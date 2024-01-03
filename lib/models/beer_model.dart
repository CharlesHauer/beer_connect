import 'package:beer_connect/utils/beer_type.dart';

class BeerModel {
  //final int id;
  final String name;
  final BeerType beerType;
  final String origin;
  final double abv;
  final bool isRated;
  final String description;

  BeerModel({
    //required this.id,
    required this.name,
    required this.beerType,
    required this.origin,
    required this.abv,
    required this.isRated,
    required this.description,
  });
}
