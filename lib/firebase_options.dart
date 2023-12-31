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
    apiKey: 'AIzaSyAV-JbSS2dTn18PO755Ejyi2TPCSlY3myI',
    appId: '1:699822614138:web:4af9768c69eed727e57dc3',
    messagingSenderId: '699822614138',
    projectId: 'flutternoteapp-61964',
    authDomain: 'flutternoteapp-61964.firebaseapp.com',
    storageBucket: 'flutternoteapp-61964.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAO8HQqs3Kb0fQaOpCjoPpHxjHxTfhahjM',
    appId: '1:699822614138:android:f58ff6d7ec6ea3f9e57dc3',
    messagingSenderId: '699822614138',
    projectId: 'flutternoteapp-61964',
    storageBucket: 'flutternoteapp-61964.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDersUnsfhjbobTaHCMYWauE3lESHdqgYY',
    appId: '1:699822614138:ios:8834b4df95d52bbee57dc3',
    messagingSenderId: '699822614138',
    projectId: 'flutternoteapp-61964',
    storageBucket: 'flutternoteapp-61964.appspot.com',
    iosClientId: '699822614138-2ad36u60ouchinlgufclfspehg8vs54p.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppNote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDersUnsfhjbobTaHCMYWauE3lESHdqgYY',
    appId: '1:699822614138:ios:8834b4df95d52bbee57dc3',
    messagingSenderId: '699822614138',
    projectId: 'flutternoteapp-61964',
    storageBucket: 'flutternoteapp-61964.appspot.com',
    iosClientId: '699822614138-2ad36u60ouchinlgufclfspehg8vs54p.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppNote',
  );
}
