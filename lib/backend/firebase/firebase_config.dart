import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC-M0aKQwpQWfkUPfg_IgqkHFUojsI6zFE",
            authDomain: "pdflow-6054a.firebaseapp.com",
            projectId: "pdflow-6054a",
            storageBucket: "pdflow-6054a.appspot.com",
            messagingSenderId: "918306806118",
            appId: "1:918306806118:web:a4cb8aade9f8cf9496d0a7",
            measurementId: "G-K3RYSBSVRN"));
  } else {
    await Firebase.initializeApp();
  }
}
