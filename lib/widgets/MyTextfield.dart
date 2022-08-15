import 'package:deltamessage/constant/constnat.dart';
import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  Mytextfield({
    required this.hinttext,
    required this.text,
    required this.enabledcolor,
    required this.focusedcolor,
    required this.textInputType,
    required this.obscure,
  });
  TextEditingController text = TextEditingController();
  final String hinttext;
  Color enabledcolor;
  Color focusedcolor;
  TextInputType textInputType;
  bool obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dpad,
      child: GestureDetector(
        onTap: () => {},
        child: TextField(
          controller: text,
          obscureText: obscure,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hinttext,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: focusedcolor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: enabledcolor)),
          ),
        ),
      ),
    );
  }
}
