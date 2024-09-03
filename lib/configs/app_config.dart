import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/local_storage.dart';
import 'firebase_config.dart';

enum _AppMode { debug, production }

final appConfig = AppConfig.value;

class AppConfig {
  static AppConfig get value => AppConfig._();
  AppConfig._();
  var appMode = kDebugMode ? _AppMode.debug : _AppMode.production;
  bool isPermissionGranted = false;

  init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
      localStorage.init(),
      firebaseConfig.init(),
    ]);
  }

  Map<String, dynamic> get configs => config[appMode.name]!;

  static const config = {
    "debug": {
      "base": {
        "app_id": "com.rsr.todosprint",
      }
    },
    "production": {
      "base": {
        "app_id": "com.rsr.todosprint",
      }
    }
  };
}
