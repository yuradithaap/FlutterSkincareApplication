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
    apiKey: 'AIzaSyAaPRmp0qRuOSfT3bkFeOtCMXHFGE-B8rw',
    appId: '1:696731780852:web:43502941c7bf4a1cc500a1',
    messagingSenderId: '696731780852',
    projectId: 'skincare-4eba2',
    authDomain: 'skincare-4eba2.firebaseapp.com',
    storageBucket: 'skincare-4eba2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjGgJWgTqnRi-BWBc8n1Vp4q6Kg32FEZo',
    appId: '1:696731780852:android:73e55d9954ed0a1ac500a1',
    messagingSenderId: '696731780852',
    projectId: 'skincare-4eba2',
    storageBucket: 'skincare-4eba2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmd2RnGzt4FdaPQVTyyb5j61ARH5L_1IU',
    appId: '1:696731780852:ios:814802379ae47ed0c500a1',
    messagingSenderId: '696731780852',
    projectId: 'skincare-4eba2',
    storageBucket: 'skincare-4eba2.appspot.com',
    iosBundleId: 'com.example.skincare',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmd2RnGzt4FdaPQVTyyb5j61ARH5L_1IU',
    appId: '1:696731780852:ios:5cc0975ea9b5ae73c500a1',
    messagingSenderId: '696731780852',
    projectId: 'skincare-4eba2',
    storageBucket: 'skincare-4eba2.appspot.com',
    iosBundleId: 'com.example.skincare.RunnerTests',
  );
}