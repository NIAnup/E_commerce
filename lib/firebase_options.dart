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
    apiKey: 'AIzaSyByXM4PlNazqhwvseKh3BvnnpW4iIVKtx8',
    appId: '1:913403942081:web:f479dd2d372375adb57040',
    messagingSenderId: '913403942081',
    projectId: 'fir-fe660',
    authDomain: 'fir-fe660.firebaseapp.com',
    storageBucket: 'fir-fe660.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmCuLYe8xraO2RgWUBaiK8M5qUExAtyfs',
    appId: '1:913403942081:android:a50355319154e621b57040',
    messagingSenderId: '913403942081',
    projectId: 'fir-fe660',
    storageBucket: 'fir-fe660.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCH4HHd6HKpq_ki1p6yZBHR4kVxHxdRj6A',
    appId: '1:913403942081:ios:c0dab8391925ddd6b57040',
    messagingSenderId: '913403942081',
    projectId: 'fir-fe660',
    storageBucket: 'fir-fe660.appspot.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCH4HHd6HKpq_ki1p6yZBHR4kVxHxdRj6A',
    appId: '1:913403942081:ios:7a36914fbe1f388cb57040',
    messagingSenderId: '913403942081',
    projectId: 'fir-fe660',
    storageBucket: 'fir-fe660.appspot.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}
