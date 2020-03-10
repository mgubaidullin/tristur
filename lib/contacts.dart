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

//class MessageList extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: Database.getUsersSnapshot(),
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//        if (!snapshot.hasData) return const Text('Loading...');
//        final int userCount = snapshot.data.documents.length;
//        return ListView.builder(
//          itemCount: userCount,
//          itemBuilder: (_, int index) {
//            final DocumentSnapshot document = snapshot.data.documents[index];
//            final String user = document['name'];
//            final Timestamp connected = document['connected'];
//            return ListTile(
//              leading: Icon(Icons.person),
//              title: Text(
//                user != null ? user : '<No data retrieved>',
//              ),
//              subtitle: Text("Connected ${connected !=null ? connected.toDate() : ''}"),
//            );
//          },
//        );
//      },
//    );
//  }
//}