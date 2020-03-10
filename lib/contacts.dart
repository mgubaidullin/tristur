import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'chat.dart';
import 'main.dart' as Main;

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text(Main.currentUser.displayName),
        ),
        body: Scrollbar(
            child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8),
                children: [
                  for (int index = 1; index < 21; index++)
                    ListTile(
                      leading: ExcludeSemantics(
                        child: CircleAvatar(child: Text('$index')),
                      ),
                      title: Text(("rip")),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                    )
                ]
            )
        )

    );
  }
}