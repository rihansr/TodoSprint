import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_sprint/configs/app_settings.dart';

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

extension DateTimeExtension on DateTime {
  String get EEEMMMd => DateFormat('EEE, MMM d', appSettings.language.languageCode).format(this);
}
