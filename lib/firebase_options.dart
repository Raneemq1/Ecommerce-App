

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAti6oP3QzlktIiUlKNL84USyMLzmJc4zA',
    appId: '1:41819123942:web:8df1b4e83dba7756458b27',
    messagingSenderId: '41819123942',
    projectId: 'ecommerce-app-b8aa4',
    authDomain: 'ecommerce-app-b8aa4.firebaseapp.com',
    storageBucket: 'ecommerce-app-b8aa4.appspot.com',
    measurementId: 'G-RQLN2SCBLE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnFr485PzxFYvDw2kn9dbtSkcZe6kuWXg',
    appId: '1:41819123942:android:8d147628e54b2640458b27',
    messagingSenderId: '41819123942',
    projectId: 'ecommerce-app-b8aa4',
    storageBucket: 'ecommerce-app-b8aa4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAiLtdENQhIFusPr3VUIr9alsNK8fV6gI',
    appId: '1:41819123942:ios:1522ebf1490a0b9a458b27',
    messagingSenderId: '41819123942',
    projectId: 'ecommerce-app-b8aa4',
    storageBucket: 'ecommerce-app-b8aa4.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAiLtdENQhIFusPr3VUIr9alsNK8fV6gI',
    appId: '1:41819123942:ios:614623c9cefa2c4a458b27',
    messagingSenderId: '41819123942',
    projectId: 'ecommerce-app-b8aa4',
    storageBucket: 'ecommerce-app-b8aa4.appspot.com',
    iosBundleId: 'com.example.ecommerceApp.RunnerTests',
  );
}
