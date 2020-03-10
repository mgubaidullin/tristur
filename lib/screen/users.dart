import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../service/database.dart';

class UsersScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: MessageList(),
    );
  }
}

// List of messages
class MessageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.getUsersSnapshot(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int userCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: userCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            final String user = document['name'];
            final Timestamp connected = document['connected'];
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(
                user != null ? user : '<No data retrieved>',
              ),
              subtitle: Text("Connected ${connected !=null ? connected.toDate() : ''}"),
            );
          },
        );
      },
    );
  }
}
