import 'package:flutter/material.dart';

class images extends StatelessWidget {
  images({required this.imagepath, required this.size});
  final String imagepath;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        imagepath,
        height: size,
      ),
    );
  }
}
