
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'contacts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ensureLoggedIn().then((user){
    runApp(new FriendlychatApp());
  });
}

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.redAccent[300],
  primaryColorBrightness: Brightness.light,
);

const String name = "Arturito";

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Christo Hub",
      theme: defaultTargetPlatform == TargetPlatform.iOS         //new
          ? kIOSTheme                                              //new
          : kDefaultTheme,
      home: new ContactScreen(),
    );
  }
}

final _auth = FirebaseAuth.instance;
FirebaseUser currentUser;

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

void signIn(){
  _googleSignIn.signIn();
}

void signOut(){
  _googleSignIn.disconnect();
}

Future<GoogleSignInAccount> signInSilently(){
  return _googleSignIn.signInSilently();
}

Future<FirebaseUser> ensureLoggedIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  currentUser = await _auth.currentUser();
  return currentUser;
}
