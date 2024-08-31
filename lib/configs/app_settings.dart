import 'package:flutter/material.dart';
import '../models/settings_model.dart';
import '../shared/local_storage.dart';

final AppSettings appSettings = AppSettings.value;

class AppSettings {
  static AppSettings get value => AppSettings._();
  AppSettings._();

  ValueNotifier<Settings> settings = ValueNotifier(localStorage.settings);

  set _settings(Settings settings) {
    this.settings.value = settings;
    localStorage.settings = settings;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    this.settings.notifyListeners();
  }

  // Theme
  set theme(dynamic mode) {
    if (mode == null) return;
    _settings = settings.value.copyWith(
      themeMode: mode is ThemeMode ? mode : ThemeMode.values.byName('$mode'),
    );
  }

  bool get isDarkTheme => settings.value.themeMode == ThemeMode.dark;

  get switchTheme => theme = isDarkTheme ? ThemeMode.light : ThemeMode.dark;

  // Locale
  set language(dynamic locale) {
    if (locale == null) return;
    _settings = settings.value.copyWith(
      locale: locale is Locale ? locale : Locale('$locale', ''),
    );
  }
}
