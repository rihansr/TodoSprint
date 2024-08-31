import 'package:shared_preferences/shared_preferences.dart';
import '../models/settings_model.dart';

final localStorage = LocalStorage.value;

class LocalStorage {
  static LocalStorage get value => LocalStorage._();
  LocalStorage._();

  late SharedPreferences _sharedPrefs;

  Future init() async => _sharedPrefs = await SharedPreferences.getInstance();

  static const String _settingsKey = "settings_sp_key";

  // Settings
  set settings(Settings settings) =>
      _sharedPrefs.setString(_settingsKey, settings.toJson());

  Settings get settings {
    final settings = _sharedPrefs.getString(_settingsKey);
    return settings == null ? const Settings() : Settings.fromJson(settings);
  }
}
