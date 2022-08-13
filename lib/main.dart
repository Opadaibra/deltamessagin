import 'package:flutter/material.dart';
import 'package:deltamessage/Screens/Welcom_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delta Message ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomScreen(),
    );
  }
}
