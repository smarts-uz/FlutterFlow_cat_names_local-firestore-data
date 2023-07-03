import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBH44WlBUK-FdMsbINGZ5MedY1yer8COKw",
            authDomain: "catnamesapp.firebaseapp.com",
            projectId: "catnamesapp",
            storageBucket: "catnamesapp.appspot.com",
            messagingSenderId: "934156519532",
            appId: "1:934156519532:web:ff1f55009793d45a847049"));
  } else {
    await Firebase.initializeApp();
  }
}
