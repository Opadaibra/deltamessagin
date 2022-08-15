// ignore_for_file: prefer_const_constructors

import 'package:deltamessage/Screens/chatscreen.dart';
import 'package:deltamessage/constant/constnat.dart';
import 'package:deltamessage/widgets/images.dart';
import 'package:deltamessage/widgets/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/MyTextfield.dart';

class Registryscreen extends StatefulWidget {
  static const String screenRoute = "Registryscreen";

  @override
  State<Registryscreen> createState() => _RegistryscreenState();
}

class _RegistryscreenState extends State<Registryscreen> {
  bool _showspineer = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showspineer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            images(imagepath: "images/DELTAME.png", size: 200),
            SizedBox(
              height: 10,
            ),
            Mytextfield(
              hinttext: "Enter your email",
              text: email,
              focusedcolor: Colors.black,
              enabledcolor: secondary,
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
              enabledcolor: secondary,
              obscure: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: 10,
            ),
            Mybutton(
                color: secondary,
                title: "register",
                onPressed: () async {
                  setState(() {
                    _showspineer = true;
                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email.text, password: password.text);
                    setState(() {
                      _showspineer = false;
                    });

                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, chatscreen.screenRoute);
                  } on Exception catch (e) {
                    print(e);
                    setState(() {
                      _showspineer = false;
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
