import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deltamessage/Screens/Welcom_screen.dart';
import 'package:deltamessage/constant/constnat.dart';
import 'package:deltamessage/widgets/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/MessageStreambuilder.dart';

class chatscreen extends StatefulWidget {
  static const String screenRoute = "chatscreen";
  @override
  State<chatscreen> createState() => _chatscreenState();
}

final _firestore = FirebaseFirestore.instance;
late User signedinuser;

class _chatscreenState extends State<chatscreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController cleartext = TextEditingController();

  String? messagetext;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedinuser = user;
        print(signedinuser.email);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void getmessages() async {
    final messages = await _firestore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        //  leading: ,
        centerTitle: true,

        // leading: IconButton(
        //     onPressed: (() => Navigator.pop(context)),
        //     icon: Icon(Icons.arrow_back_ios)),
        title: Text("DeltaME"),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushNamed(context, WelcomScreen.screenRoute);
                //    messagesStream();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreambuilder(),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: primary,
                width: 2,
              ))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: TextField(
                    onChanged: (value) {
                      messagetext = value;
                    },
                    controller: cleartext,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(

                        // ignore: prefer_const_constructors
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: "write your message here...",
                        border: InputBorder.none),
                  )),
                  TextButton(
                      onPressed: () {
                        cleartext.clear();
                        _firestore.collection("newm").add({
                          'text': messagetext,
                          'sender': signedinuser.email,
                          'time': FieldValue.serverTimestamp()
                        });
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(color: primary),
                      )),
                ],
              ),
            ),
            // Container(),
          ],
        ),
      ),
    );
  }
}
