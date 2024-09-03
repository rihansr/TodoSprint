import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../configs/app_settings.dart';

final extension = Utils.value;

class Utils {
  static Utils get value => Utils._();
  Utils._();

  Color get randomColor => Colors.primaries[Random().nextInt(Colors.primaries.length)];
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
  String get EEEMMMd =>
      DateFormat('EEE, MMM d', appSettings.language.languageCode).format(this);

  String get time {
    final now = DateTime.now();
    final locale = appSettings.language.languageCode;
    String time() => DateFormat('h:mm a', locale).format(this);
    if (year == now.year && month == now.month && day == now.day) {
      return 'Today, ${time()}';
    } else if (year == now.year && month == now.month && day == now.day + 1) {
      return 'Tomorrow, ${time()}';
    } else if (year == now.year && month == now.month && day == now.day - 1) {
      return 'Yesterday, ${time()}';
    } else {
      return DateFormat('EEE, MMM d', appSettings.language.languageCode)
          .format(this);
    }
  }
}
