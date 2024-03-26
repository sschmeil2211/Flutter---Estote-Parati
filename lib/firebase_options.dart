// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCdGQPYCke93ymFW4Acsu-YKkBKsXHYpQ4',
    appId: '1:260921527227:web:914d74e9e07367f2a3129e',
    messagingSenderId: '260921527227',
    projectId: 'estote-parati',
    authDomain: 'estote-parati.firebaseapp.com',
    storageBucket: 'estote-parati.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSe1VKpC8DcbI2erJlkOkATGdd1U0p7ME',
    appId: '1:260921527227:android:800f24ff58f387a8a3129e',
    messagingSenderId: '260921527227',
    projectId: 'estote-parati',
    storageBucket: 'estote-parati.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI876kAujWaMmTSBSGJYs0iihmiwCtOhs',
    appId: '1:260921527227:ios:88dfa2c05d423db9a3129e',
    messagingSenderId: '260921527227',
    projectId: 'estote-parati',
    storageBucket: 'estote-parati.appspot.com',
    iosBundleId: 'com.example.estoteParati',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI876kAujWaMmTSBSGJYs0iihmiwCtOhs',
    appId: '1:260921527227:ios:c37e52951d4e233ea3129e',
    messagingSenderId: '260921527227',
    projectId: 'estote-parati',
    storageBucket: 'estote-parati.appspot.com',
    iosBundleId: 'com.example.estoteParati.RunnerTests',
  );
}