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
    apiKey: 'AIzaSyBW7mT3wZSCXJAJOItoZrED7O5XMNRywyI',
    appId: '1:333168850494:web:64a27001c353fcb666836f',
    messagingSenderId: '333168850494',
    projectId: 'grocery-app-32be0',
    authDomain: 'grocery-app-32be0.firebaseapp.com',
    storageBucket: 'grocery-app-32be0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzSqlCxCMW35jCqOcPK7X2DXOycWTrP2U',
    appId: '1:333168850494:android:b6c2f97b37d45efe66836f',
    messagingSenderId: '333168850494',
    projectId: 'grocery-app-32be0',
    storageBucket: 'grocery-app-32be0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPq4lckBQuBrHKQ4y4AXz-4Akg1rBhIhA',
    appId: '1:333168850494:ios:af8d4b481921c12966836f',
    messagingSenderId: '333168850494',
    projectId: 'grocery-app-32be0',
    storageBucket: 'grocery-app-32be0.firebasestorage.app',
    iosClientId: '333168850494-haiauoi5ns3knvgir194jtgktgvvaopk.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryAppAdmin5',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPq4lckBQuBrHKQ4y4AXz-4Akg1rBhIhA',
    appId: '1:333168850494:ios:af8d4b481921c12966836f',
    messagingSenderId: '333168850494',
    projectId: 'grocery-app-32be0',
    storageBucket: 'grocery-app-32be0.firebasestorage.app',
    iosClientId: '333168850494-haiauoi5ns3knvgir194jtgktgvvaopk.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryAppAdmin5',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBW7mT3wZSCXJAJOItoZrED7O5XMNRywyI',
    appId: '1:333168850494:web:dfd0864fbfb8185366836f',
    messagingSenderId: '333168850494',
    projectId: 'grocery-app-32be0',
    authDomain: 'grocery-app-32be0.firebaseapp.com',
    storageBucket: 'grocery-app-32be0.firebasestorage.app',
  );
}
