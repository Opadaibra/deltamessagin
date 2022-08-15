import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deltamessage/Screens/chatscreen.dart';
import 'package:deltamessage/constant/constnat.dart';
import 'package:deltamessage/widgets/MessagLine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageStreambuilder extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('newm').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messagewidgets = [];

          if (!snapshot.hasData) {
            //spinner
            CircularProgressIndicator(
              backgroundColor: primary,
            );
          } else {
            final newmessages = snapshot.data!.docs;
            for (var mesage in newmessages) {
              final messagetext = mesage.get('text');
              final messagsender = mesage.get('sender');
              final currentuser = signedinuser.email;
              if (currentuser == messagsender) {
                //
              }

              final messagewidgit = MessageLine(
                text: messagetext,
                sender: messagsender,
                isMe: currentuser == messagsender,
              );
              messagewidgets.add(messagewidgit);
            }
          }
          return Expanded(
              child: ListView(
                  // ignore: prefer_const_constructors
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  children: messagewidgets));
        });
  }
}
