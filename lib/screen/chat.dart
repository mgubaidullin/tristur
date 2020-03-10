//import 'dart:async';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//
//class ChatScreen extends StatefulWidget {
//  FirebaseUser _currentUser;
//
//  ChatScreen(this._currentUser);
//
//  @override
//  State createState() => new ChatScreenState(_currentUser);
//}
//
//class ChatScreenState extends State<ChatScreen> {
//  FirebaseUser _currentUser;
//  CollectionReference get messages => Database..collection('messages');
//
//  ChatScreenState(this._currentUser);
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('User: ${_currentUser.email}'),
//        centerTitle: true,
//      ),
//      body: MessageList(firestore: _firestore),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _addMessage,
//        tooltip: 'Add',
//        child: const Icon(Icons.add),
//      ),
//    );
//  }
//
//  Future<void> _addMessage() async {
//    await messages.add(<String, dynamic>{
//      'message': 'Hello world!',
//      'created_at': FieldValue.serverTimestamp(),
//    });
//  }
//}
//
//// List of messages
//class MessageList extends StatelessWidget {
//  MessageList({this.firestore});
//
//  final Firestore firestore;
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: firestore
//          .collection("messages")
//          .orderBy("created_at", descending: true)
//          .snapshots(),
//      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//        if (!snapshot.hasData) return const Text('Loading...');
//        final int messageCount = snapshot.data.documents.length;
//        return ListView.builder(
//          itemCount: messageCount,
//          itemBuilder: (_, int index) {
//            final DocumentSnapshot document = snapshot.data.documents[index];
//            final dynamic message = document['message'];
//            return ListTile(
//              trailing: IconButton(
//                onPressed: () => document.reference.delete(),
//                icon: Icon(Icons.delete),
//              ),
//              title: Text(
//                message != null ? message.toString() : '<No message retrieved>',
//              ),
//              subtitle: Text('Message ${index + 1} of $messageCount'),
//            );
//          },
//        );
//      },
//    );
//  }
//}
