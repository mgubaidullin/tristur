import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../service/login.dart' as Login;
import '../service/database.dart';

class UsersScreen extends StatefulWidget {
  FirebaseUser _currentUser;

  UsersScreen(this._currentUser);

  @override
  State createState() => new UsersScreenState(_currentUser);
}

class UsersScreenState extends State<UsersScreen> {
  FirebaseUser _currentUser;
  CollectionReference get users => Database.getFirestore().collection('users');

  UsersScreenState(this._currentUser);

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        centerTitle: true,
      ),
      body: MessageList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMessage,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _addMessage() async {
    await users.add(<String, dynamic>{
      'message': 'Hello world!',
      'created_at': FieldValue.serverTimestamp(),
    });
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
        final int messageCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            final String user = document['name'];
            final Timestamp connected = document['connected'];
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(
                user != null ? user : '<No data retrieved>',
              ),
              subtitle: Text('Connected ${connected.toDate()}'),
            );
          },
        );
      },
    );
  }
}
