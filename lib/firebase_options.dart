// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUYC83NObWCtK6nwJe1GOWQkYIGPeh8SM',
    appId: '1:114140221907:web:728de9614764f1c35a5f26',
    messagingSenderId: '114140221907',
    projectId: 'bsn-clothes',
    authDomain: 'bsn-clothes.firebaseapp.com',
    databaseURL: 'https://bsn-clothes-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'bsn-clothes.appspot.com',
    measurementId: 'G-EX9GWDBGLR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBl_xA8vUSTqqahe6I14ht_DkXr_8p2b7M',
    appId: '1:114140221907:android:0481e7adfb9c89145a5f26',
    messagingSenderId: '114140221907',
    projectId: 'bsn-clothes',
    databaseURL: 'https://bsn-clothes-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'bsn-clothes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRgu9bAKvv1SYlm6IdcbV5Tcn2ysjslxo',
    appId: '1:114140221907:ios:2c95b6e78bae161b5a5f26',
    messagingSenderId: '114140221907',
    projectId: 'bsn-clothes',
    databaseURL: 'https://bsn-clothes-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'bsn-clothes.appspot.com',
    iosClientId: '114140221907-hn5bj99b3g4lrc2j7c5kfptv9fupeeib.apps.googleusercontent.com',
    iosBundleId: 'com.example.bsnClothes',
  );

}