import 'package:flutter/widgets.dart';
import 'dart:convert';

class EmojisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          utf8.decode([
            0xF0,0x9F,0x8F,0x89, //football
            0xF0,0x9F,0x8D,0xBA, //beer
            0xF0,0x9F,0x92,0xBB, //computer
            0xF0,0x9F,0x9A,0x80, //rocket
            0xF0,0x9F,0x98,0x82, //laughing
            0xF0,0x9F,0x93,0xB1, //mobile
            0xF0,0x9F,0x98,0x81, //smiling
          ]),
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
