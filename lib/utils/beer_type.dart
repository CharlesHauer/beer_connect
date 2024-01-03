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
        return 'Unknown';
    }
  }

  static BeerType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'aromatisée':
        return BeerType.flavored;
      case 'blonde':
        return BeerType.blonde;
      default:
        return BeerType.flavored; // Par défaut, retourne par exemple la bière aromatisée
    }
  }
}