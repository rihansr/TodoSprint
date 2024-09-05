import 'dart:ui';

enum AlertType { success, error, info }

enum Language {
  english,
  spanish,
  french;

  String get displayName {
    switch (this) {
      case Language.spanish:
        return 'Español';
      case Language.french:
        return 'Français';
      default:
        return 'English';
    }
  }

  Locale get locale {
    switch (this) {
      case Language.spanish:
        return const Locale('es', 'ES');
      case Language.french:
        return const Locale('fr', 'FR');
      default:
        return const Locale('en', 'US');
    }
  }
}
