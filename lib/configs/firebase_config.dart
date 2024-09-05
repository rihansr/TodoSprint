import 'package:firebase_core/firebase_core.dart'
    show Firebase, FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import '../services/analytics_service.dart';
import '../services/auth_service.dart';

final firebaseConfig = FirebaseConfig.value;

class FirebaseConfig {
  static FirebaseConfig get value => FirebaseConfig._();
  FirebaseConfig._();

  Future<void> init() async {
    Firebase.apps.isEmpty
        ? await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          )
        : Firebase.app();

    Future.wait([
      analyticsService.init(),
      authService.init(),
    ]);
  }
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBzmepPD34VWxZ7-cxulkeahB2FYGEgrc4',
    appId: '1:406099696497:web:87e25e51afe982cd3574d0',
    messagingSenderId: '863257218129',
    projectId: 'todo-sprint-434207',
    authDomain: 'flutterfire-e2e-tests.firebaseapp.com',
    storageBucket: 'todo-sprint-434207.appspot.com',
    measurementId: 'G-JN95N1JV2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAM50OAz3qYqd954FxHOvguBk6UjjNePsc',
    appId: '1:863257218129:android:697c0dd425aad1f8cebc70',
    messagingSenderId: '863257218129',
    projectId: 'todo-sprint-434207',
    storageBucket: 'todo-sprint-434207.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7zVnXbBBzfcsrvw6LFyijJWz7P3wDB2M',
    appId: '1:1084669682207:ios:d31df9e1c74d92aec46b2a',
    messagingSenderId: '863257218129',
    projectId: 'todo-sprint-434207',
    storageBucket: 'todo-sprint-434207.appspot.com',
    iosClientId:
        '406099696497-taeapvle10rf355ljcvq5dt134mkghmp.apps.googleusercontent.com',
    iosBundleId: 'com.rsr.todosprint',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c',
    appId: '1:406099696497:ios:acd9c8e17b5e620e3574d0',
    messagingSenderId: '863257218129',
    projectId: 'todo-sprint-434207',
    storageBucket: 'todo-sprint-434207.appspot.com',
    androidClientId:
        '406099696497-tvtvuiqogct1gs1s6lh114jeps7hpjm5.apps.googleusercontent.com',
    iosClientId:
        '406099696497-taeapvle10rf355ljcvq5dt134mkghmp.apps.googleusercontent.com',
    iosBundleId: 'io.flutter.plugins.firebase.tests',
  );
}
