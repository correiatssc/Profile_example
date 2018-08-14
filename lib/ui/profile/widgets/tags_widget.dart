import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TagsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color gold = Color(0xFFEDC130);
    final Color silver = Color(0xFFABAFB2);
    final Color bronze = Color(0xFFC79E7D);
    final Color neutralBlue = Color(0xFF4EACB7);
    final DocumentReference skillSetDocument = Firestore.instance
        .collection('skill_set_widget')
        .document('correia.tssc');

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child:
              buildChipsRow(context, skillSetDocument.collection('gold'), gold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: 
              buildChipsRow(context, skillSetDocument.collection('siver'), silver),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: 
              buildChipsRow(context, skillSetDocument.collection('bronze'), bronze),
        ),
              buildChipsRow(context, skillSetDocument.collection('other'), neutralBlue),
      ],
    );
  }

  Widget buildChipsRow(
      BuildContext context, CollectionReference skills, Color color) {
    return StreamBuilder(
        stream: skills.snapshots(),
        builder: (context, snapshot) {
          return buildChipRow(context,
            new List<Widget>.from(snapshot.data.documents
                .map(
                    (skill) => buildChip(color, '#' + skill.data['name']))
                .toList()),
          );
        });
  }

  Widget buildChipRow(context, children) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Wrap(runSpacing: 6.0, spacing: 6.0, children: children));
  }

  Widget buildChip(color, text) {
    return Chip(
      backgroundColor: color,
      label: Text(text,
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.white)),
    );
  }
}
