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
    apiKey: 'AIzaSyAzm5DRSCVe1dkXKiYYwwUZq_cvDjYtwZ8',
    appId: '1:740419009437:web:4ec8fe67d0a208b5d2cd74',
    messagingSenderId: '740419009437',
    projectId: 'bookly-app-76aa8',
    authDomain: 'bookly-app-76aa8.firebaseapp.com',
    storageBucket: 'bookly-app-76aa8.appspot.com',
    measurementId: 'G-BFV2BQ4BP7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi1YUugZIl0It9A60QtGo5OKxtHoYvwM8',
    appId: '1:740419009437:android:06dad2de85c6b745d2cd74',
    messagingSenderId: '740419009437',
    projectId: 'bookly-app-76aa8',
    storageBucket: 'bookly-app-76aa8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5Irj5HTCAa4YCIFGoTKNin-9lL8yLgkY',
    appId: '1:740419009437:ios:f292073c9254ac4fd2cd74',
    messagingSenderId: '740419009437',
    projectId: 'bookly-app-76aa8',
    storageBucket: 'bookly-app-76aa8.appspot.com',
    iosBundleId: 'com.example.booklyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5Irj5HTCAa4YCIFGoTKNin-9lL8yLgkY',
    appId: '1:740419009437:ios:d420f78ec5ff5ac2d2cd74',
    messagingSenderId: '740419009437',
    projectId: 'bookly-app-76aa8',
    storageBucket: 'bookly-app-76aa8.appspot.com',
    iosBundleId: 'com.example.booklyApp.RunnerTests',
  );
}
