// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDjvTj_1RyMsYSRM0KslvyB2X5UYOllOF0',
    appId: '1:559664637598:web:4618f9d6e432bbb921fd8f',
    messagingSenderId: '559664637598',
    projectId: 'midnimo-gas-b345d',
    authDomain: 'midnimo-gas-b345d.firebaseapp.com',
    storageBucket: 'midnimo-gas-b345d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCclYLV1H4zB2x4BAMnc5gw5aRYAxEl8M4',
    appId: '1:559664637598:android:cdbbcda2f83610a421fd8f',
    messagingSenderId: '559664637598',
    projectId: 'midnimo-gas-b345d',
    storageBucket: 'midnimo-gas-b345d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_iNvaq0jvVNRbG1gKFXFOKOjydTkvigU',
    appId: '1:559664637598:ios:21509c76d8bfda2c21fd8f',
    messagingSenderId: '559664637598',
    projectId: 'midnimo-gas-b345d',
    storageBucket: 'midnimo-gas-b345d.appspot.com',
    iosBundleId: 'com.example.midnimo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_iNvaq0jvVNRbG1gKFXFOKOjydTkvigU',
    appId: '1:559664637598:ios:21509c76d8bfda2c21fd8f',
    messagingSenderId: '559664637598',
    projectId: 'midnimo-gas-b345d',
    storageBucket: 'midnimo-gas-b345d.appspot.com',
    iosBundleId: 'com.example.midnimo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjvTj_1RyMsYSRM0KslvyB2X5UYOllOF0',
    appId: '1:559664637598:web:6c28717027a5371d21fd8f',
    messagingSenderId: '559664637598',
    projectId: 'midnimo-gas-b345d',
    authDomain: 'midnimo-gas-b345d.firebaseapp.com',
    storageBucket: 'midnimo-gas-b345d.appspot.com',
  );
}
