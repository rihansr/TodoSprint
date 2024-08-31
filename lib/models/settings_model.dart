import 'dart:convert';
import 'package:flutter/material.dart';

class Settings {
  final ThemeMode themeMode;
  final Locale locale;

  const Settings({
    this.themeMode = ThemeMode.system,
    this.locale = const Locale('en', ''),
  });

  Settings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return Settings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  factory Settings.fromMap(Map<String, dynamic> map) => Settings(
        themeMode: ThemeMode.values.byName(map["theme_mode"]),
        locale: Locale(map["locale"]),
      );

  Map<String, dynamic> toMap() => {
        "theme_mode": themeMode.name,
        "locale": locale.languageCode,
      };

  String toJson() => jsonEncode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(jsonDecode(source));
}
