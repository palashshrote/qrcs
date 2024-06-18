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
    apiKey: 'AIzaSyDVsClw3LKQsqg04kfL2AuSy9cUnwcav38',
    appId: '1:438714719320:web:70ae22cc6c32cd5a3f7e2d',
    messagingSenderId: '438714719320',
    projectId: 'devicevalidator-dc1e3',
    authDomain: 'devicevalidator-dc1e3.firebaseapp.com',
    storageBucket: 'devicevalidator-dc1e3.appspot.com',
    measurementId: 'G-0NTDSY96CL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHV1ud7of01ifjFayJrDFld57bAGAMPvE',
    appId: '1:438714719320:android:ff3fa88601bc483e3f7e2d',
    messagingSenderId: '438714719320',
    projectId: 'devicevalidator-dc1e3',
    storageBucket: 'devicevalidator-dc1e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuZTHqpjgZ5XdQjgzxHuJ0L4s73hs-UKY',
    appId: '1:438714719320:ios:4f50525cb443699f3f7e2d',
    messagingSenderId: '438714719320',
    projectId: 'devicevalidator-dc1e3',
    storageBucket: 'devicevalidator-dc1e3.appspot.com',
    iosBundleId: 'com.example.qrcs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBuZTHqpjgZ5XdQjgzxHuJ0L4s73hs-UKY',
    appId: '1:438714719320:ios:4f50525cb443699f3f7e2d',
    messagingSenderId: '438714719320',
    projectId: 'devicevalidator-dc1e3',
    storageBucket: 'devicevalidator-dc1e3.appspot.com',
    iosBundleId: 'com.example.qrcs',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVsClw3LKQsqg04kfL2AuSy9cUnwcav38',
    appId: '1:438714719320:web:b07a4979e5bf57bb3f7e2d',
    messagingSenderId: '438714719320',
    projectId: 'devicevalidator-dc1e3',
    authDomain: 'devicevalidator-dc1e3.firebaseapp.com',
    storageBucket: 'devicevalidator-dc1e3.appspot.com',
    measurementId: 'G-HRYC8S2HSK',
  );
}
