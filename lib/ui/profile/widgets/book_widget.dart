import 'dart:convert';

import 'package:flutter/widgets.dart';

class BookWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(utf8.decode([0xF0, 0x9F, 0x93, 0x96]) +
            ' How to do twice the work in half the time'),
      ],
    );
  }
}
