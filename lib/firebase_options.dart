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
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGf52SNOL66F1UhxO-CDMcNnBAzdxvDxw',
    appId: '1:880842692933:android:ca22a6f1165924b0b2462c',
    messagingSenderId: '880842692933',
    projectId: 'cabeleleila-flutter',
    databaseURL: 'https://cabeleleila-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'cabeleleila-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAirdOpkCEitteR26wK7gH2wk_3XZSTk0',
    appId: '1:880842692933:ios:1a2bdb387b236186b2462c',
    messagingSenderId: '880842692933',
    projectId: 'cabeleleila-flutter',
    databaseURL: 'https://cabeleleila-flutter-default-rtdb.firebaseio.com',
    storageBucket: 'cabeleleila-flutter.appspot.com',
    iosClientId: '880842692933-oi4jeiu9igkhk6pusr4g8sbaksprvt13.apps.googleusercontent.com',
    iosBundleId: 'com.example.cabeleleila',
  );

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
}
