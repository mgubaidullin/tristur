import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Database {
  static Firestore _firestore;

  static Future<Firestore> _prepare() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'test',
      options: const FirebaseOptions(
        googleAppID: '1:129700375978:android:377780d06daf3dada18fd3',
        apiKey: 'AIzaSyAFIsq_16tVNi8oFblHgBS5kbcNNonmrsc',
        projectID: 'nsi-demo',
      ),
    );
    return Firestore(app: app);
  }

  static void prepare() {
    if (_firestore == null) {
      _prepare().then((db){
        _firestore = db;
      });
    }
  }

  static Firestore getFirestore(){
    return _firestore;
  }

  static updateUser(String email, String name) async {
    Map<String, dynamic> userData = {
      'name': name,
      'connected': FieldValue.serverTimestamp(),
    };
    final CollectionReference postsRef = _firestore.collection('users');
    await postsRef.document(email).setData(userData);
  }

  static Stream<QuerySnapshot> getUsersSnapshot(){
    return _firestore.collection("users").orderBy("name", descending: false).snapshots();
  }
}

