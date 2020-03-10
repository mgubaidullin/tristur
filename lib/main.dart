import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/screen/users.dart';
import 'package:friendlychat/service/login.dart' as Login;
import 'package:friendlychat/service/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database.prepare();
  // login
  Login.ensureLoggedIn().then((user) {
    Database.updateUser(user.email, user.displayName);
    runApp(ChatApp(user));
  });
}

class ChatApp extends StatelessWidget {
  FirebaseUser _currentUser;

  ChatApp(this._currentUser);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UsersScreen(_currentUser),
    );
  }
}
