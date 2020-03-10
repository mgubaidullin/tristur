import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/screen/users.dart';
import '../service/login.dart' as Login;
import 'chat.dart';

class SignInScreen extends StatefulWidget {
  FirebaseUser _currentUser;

  SignInScreen(this._currentUser);

  @override
  State createState() => new SignInScreenState(_currentUser);
}

class SignInScreenState extends State<SignInScreen> {
  FirebaseUser _currentUser;

  SignInScreenState(this._currentUser);

  @override
  void initState() {
    super.initState();
//    Login.ensureLoggedIn().then((gacc) {
//      _currentUser = gacc;
//    });
  }

  Future<Null> _handleSignIn() async {
    try {
      await Login.signIn();
    } catch (error) {
      print(error);
    }
  }

  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Image.asset("assets/icon/icon.png"),
        const SizedBox(width: 4.0),
        Text('Christo Hub')
      ]),
      Text("You are not currently signed in."),
      RaisedButton(child: const Text('SIGN IN'), onPressed: _handleSignIn),
    ];
    if (_currentUser != null) {
      return new UsersScreen(_currentUser);
    } else {
      return new Scaffold(
          body: new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: list,
        ),
      ));
    }
  }

}
