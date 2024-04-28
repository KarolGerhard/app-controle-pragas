
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'firebase_options.dart';
// 
// import 'package:firebase_core/firebase_core.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}






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
    apiKey: 'AIzaSyDAy8KNHR9CKQMnHumznIyQhm5ulZmh_KY',
    appId: '1:548204140036:web:280f4b37d13fbcf68a0751',
    messagingSenderId: '548204140036',
    projectId: 'controle-pragas',
    authDomain: 'controle-pragas.firebaseapp.com',
    storageBucket: 'controle-pragas.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB45BO44cqJfj0tSbwJofDuSnOxbrOORqI',
    appId: '1:548204140036:android:99c3debbc67f35ed8a0751',
    messagingSenderId: '548204140036',
    projectId: 'controle-pragas',
    storageBucket: 'controle-pragas.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhD6HEPq-UETXfjMFvcQ9T11DWkdu3qiU',
    appId: '1:548204140036:ios:433ba39922e2f4888a0751',
    messagingSenderId: '548204140036',
    projectId: 'controle-pragas',
    storageBucket: 'controle-pragas.appspot.com',
    iosClientId: '548204140036-t83g775l91pqjbns436gfrgn03o72uv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.controlePragas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhD6HEPq-UETXfjMFvcQ9T11DWkdu3qiU',
    appId: '1:548204140036:ios:433ba39922e2f4888a0751',
    messagingSenderId: '548204140036',
    projectId: 'controle-pragas',
    storageBucket: 'controle-pragas.appspot.com',
    iosClientId: '548204140036-t83g775l91pqjbns436gfrgn03o72uv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.controlePragas',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDAy8KNHR9CKQMnHumznIyQhm5ulZmh_KY',
    appId: '1:548204140036:web:37899057cb459a8b8a0751',
    messagingSenderId: '548204140036',
    projectId: 'controle-pragas',
    authDomain: 'controle-pragas.firebaseapp.com',
    storageBucket: 'controle-pragas.appspot.com',
  );
}
