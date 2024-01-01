import 'package:beer_connect/utils/beer_type.dart';

class BeerModel {
  final int id;
  final String name;
  final BeerType beerType;
  final double price;
  final double abv;
  final bool isRated;
  final String description;

  BeerModel({
    required this.id,
    required this.name,
    required this.beerType,
    required this.price,
    required this.abv,
    required this.isRated,
    required this.description,
  });
}
