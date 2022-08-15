// ignore_for_file: prefer_const_constructors

import 'package:deltamessage/Screens/chatscreen.dart';
import 'package:deltamessage/constant/constnat.dart';
import 'package:deltamessage/widgets/MyTextfield.dart';
import 'package:deltamessage/widgets/images.dart';
import 'package:deltamessage/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signin extends StatefulWidget {
  static const String screenRoute = "Signinscreen";

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool showspinner = false;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            images(
              imagepath: "images/DELTAME.png",
              size: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfield(
              hinttext: "Enter your email",
              text: email,
              focusedcolor: Colors.black,
              enabledcolor: primary,
              obscure: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            Mytextfield(
              hinttext: "Enter your Pasword",
              text: password,
              focusedcolor: Colors.black,
              enabledcolor: primary,
              obscure: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 10,
            ),
            Mybutton(
                color: primary,
                title: "Sign in",
                onPressed: () async {
                  setState(() {
                    showspinner = true;
                  });

                  try {
                    final _user = await _auth.signInWithEmailAndPassword(
                        email: email.text, password: password.text);
                    if (_user != null) {
                      Navigator.pushNamed(context, chatscreen.screenRoute);
                      setState(() {
                        showspinner = false;
                      });
                    }
                  } on Exception catch (e) {
                    print("hi $e");
                    // TODOp
                    setState(() {
                      showspinner = false;
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
