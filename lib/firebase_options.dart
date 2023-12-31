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
    apiKey: 'AIzaSyDNcjTuZ6ntAKA3OSnayCWLDo_tPwvQ2oY',
    appId: '1:616040009174:web:1761102b54895abe68e877',
    messagingSenderId: '616040009174',
    projectId: 'udemy-course-96251',
    authDomain: 'udemy-course-96251.firebaseapp.com',
    storageBucket: 'udemy-course-96251.appspot.com',
    measurementId: 'G-K2TFNJK37G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANnQ7nZUMZ9m6eZW50uBWuZuGQsq44Gv4',
    appId: '1:616040009174:android:844a9b7a99797e1768e877',
    messagingSenderId: '616040009174',
    projectId: 'udemy-course-96251',
    storageBucket: 'udemy-course-96251.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAScu6IXwBkvOVSDEe_9J9j0hXPGJlQwWk',
    appId: '1:616040009174:ios:5c1f2d72d48a871e68e877',
    messagingSenderId: '616040009174',
    projectId: 'udemy-course-96251',
    storageBucket: 'udemy-course-96251.appspot.com',
    iosClientId: '616040009174-j7p3sq13gj8nabom33e2dfrhbbjfrfsj.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAScu6IXwBkvOVSDEe_9J9j0hXPGJlQwWk',
    appId: '1:616040009174:ios:be7f2aba5698a6c268e877',
    messagingSenderId: '616040009174',
    projectId: 'udemy-course-96251',
    storageBucket: 'udemy-course-96251.appspot.com',
    iosClientId: '616040009174-gdjdhhe412iiqej0fm392vo6o8o3ra2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialApp.RunnerTests',
  );
}
