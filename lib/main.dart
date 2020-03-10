import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/screen/users.dart';
import 'package:friendlychat/service/login.dart' as Login;
import 'package:friendlychat/service/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // prepare database
  Database.prepare();
  // login
  Login.ensureLoggedIn().then((user) {
    Database.updateUser(user.email, user.displayName);
    runApp(ChatApp());
  });
}

class ChatApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UsersScreen(),
    );
  }
}
