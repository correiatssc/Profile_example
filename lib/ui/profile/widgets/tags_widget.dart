import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            buildChip(color: Colors.amberAccent, text: '#android'),
          ]),
          Row(children: <Widget>[
            buildChip(color: Colors.grey, text: '#ios'),
            buildChip(color: Colors.grey, text: '#firebase')
          ]),
          Row(children: <Widget>[
            buildChip(color: Colors.brown, text: '#mongodb')
          ]),
          Row(children: <Widget>[
            buildChip(color: Colors.blue, text: '#angularjs'),
            buildChip(color: Colors.blue, text: '#nodejs'),
            buildChip(color: Colors.blue, text: '#sketch')
          ])
        ],
      ),
    );
  }

  Widget buildChip({color, text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
      child: Chip(
          backgroundColor: color,
          padding: EdgeInsets.all(8.0),
          label: Text(text,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white))),
    );
  }
}
