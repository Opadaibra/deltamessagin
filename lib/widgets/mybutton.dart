import 'package:deltamessage/constant/constnat.dart';

import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  Mybutton({required this.color, required this.title, required this.onPressed});
  final Color color;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: dpad,
        margin: dpad,
        child: Material(
          elevation: 5,
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(color: background, fontSize: 16),
              )),
        ),
      ),
    );
  }
}
