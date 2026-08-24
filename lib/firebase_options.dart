// File generated for medcrew project.
// This connects the app to your Firebase project (med-crew).
// Values below come from your google-services.json / Firebase console.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web is not configured for this app.');
    }
    if (Platform.isAndroid) {
      return android;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7AeXgMFzJvhGAbRY8ov5gmPDUGD_T3yc',
    appId: '1:677345499540:android:37327fb9c98f04ff559781',
    messagingSenderId: '677345499540',
    projectId: 'med-crew',
    storageBucket: 'med-crew.firebasestorage.app',
  );
}
