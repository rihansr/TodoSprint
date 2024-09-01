import 'package:flutter/material.dart';

final extension = Utils.value;

class Utils {
  static Utils get value => Utils._();
  Utils._();
}

extension HexColorExtension on String {
  Color get color {
    String hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      // Add alpha value if not provided
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

extension ColorExtension on Color {
  String get hex => value.toRadixString(16).substring(2).toUpperCase();
}
