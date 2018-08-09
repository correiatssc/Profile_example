import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ui/profile/widgets/emojis_widgets.dart';
import 'package:flutter_app/ui/profile/widgets/small_win_widget.dart';
import 'package:flutter_app/ui/profile/widgets/tags_widget.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: TagsWidget(),
            width: MediaQuery.of(context).size.width)),
        Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: EmojisWidget(),
                width: MediaQuery.of(context).size.width)),
        Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
                padding: EdgeInsets.all(8.0),
                child: SmallWinWidget(),
                width: MediaQuery.of(context).size.width)),
        Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Container(
                child: Text("WIDGET"),
                height: 200.0,
                width: MediaQuery.of(context).size.width)),
      ]);
  }
}