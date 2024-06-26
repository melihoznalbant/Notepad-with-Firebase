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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVOoc7Az43xKM89l9TGPx5eJDsaGvH-1E',
    appId: '1:795341688381:android:bb42ebdc600d12416fa454',
    messagingSenderId: '795341688381',
    projectId: 'flutteruiblocapi',
    storageBucket: 'flutteruiblocapi.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBc5odVrtTq2EJgXPDxA0LLEcndRw05enc',
    appId: '1:795341688381:ios:115ca3109e77365c6fa454',
    messagingSenderId: '795341688381',
    projectId: 'flutteruiblocapi',
    storageBucket: 'flutteruiblocapi.appspot.com',
    androidClientId: '795341688381-m1gi5f6e0j3grd8oh85frp5doetuilgr.apps.googleusercontent.com',
    iosClientId: '795341688381-ce3uoc5gaob1ol6gnds38ufe7gmp9ne5.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterUiApiBloc',
  );

}