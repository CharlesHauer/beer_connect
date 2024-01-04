import 'package:flutter/services.dart';

class FileUtils {
  static Future<bool> checkIfImageExists(String beerName) async {
    try {
      await rootBundle.load('assets/picture/$beerName.png');
      return true;
    } catch (_) {
      return false;
    }
  }
}