
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'contacts.dart';

void main() {
  runApp(new FriendlychatApp());
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
