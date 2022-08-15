import 'package:deltamessage/Screens/Signinscreen.dart';
import 'package:deltamessage/Screens/chatscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:deltamessage/Screens/Welcom_screen.dart';
import 'package:deltamessage/Screens/Registryscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delta Message ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: chatscreen(),
      initialRoute: _auth.currentUser != null
          ? chatscreen.screenRoute
          : WelcomScreen.screenRoute,
      routes: {
        WelcomScreen.screenRoute: (context) => WelcomScreen(),
        Signin.screenRoute: (context) => Signin(),
        Registryscreen.screenRoute: (context) => Registryscreen(),
        chatscreen.screenRoute: (context) => chatscreen(),
      },
    );
  }
}
