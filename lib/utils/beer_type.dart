enum BeerType {
  flavored,
  blonde,
}

extension BeerTypeExtension on BeerType {

  String asString() {
    switch (this) {
      case BeerType.flavored:
        return 'Aromatisée';
      case BeerType.blonde:
        return 'Blonde';
      default:
        return 'unkown';
    }
  }
}