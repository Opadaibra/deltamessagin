// ignore: file_names
import 'package:deltamessage/Screens/Registryscreen.dart';
import 'package:deltamessage/Screens/Signinscreen.dart';
import 'package:deltamessage/constant/constnat.dart';
import 'package:deltamessage/widgets/images.dart';
import 'package:deltamessage/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatefulWidget {
  static const String screenRoute = "Welcom_screen";

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          images(imagepath: "images/DELTAME.png", size: 300),
          Mybutton(
            color: primary,
            title: 'Sign in',
            onPressed: () {
              print("rasda");
              Navigator.pushNamed(context, Signin.screenRoute);
            },
          ),
          Mybutton(
            color: secondary,
            title: 'register',
            onPressed: () {
              Navigator.pushNamed(context, Registryscreen.screenRoute);
            },
          )
        ],
      ),
    );
  }
}
