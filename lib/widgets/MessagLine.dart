import 'package:deltamessage/constant/constnat.dart';
import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  const MessageLine(
      {required this.sender, required this.text, required this.isMe});
  final String? sender;
  final String? text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isMe)
            Text(
              "$sender",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
            elevation: 5,
            color: isMe ? primary : secondary,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text(
                "$text",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
