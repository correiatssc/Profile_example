import 'package:flutter/material.dart';
import 'package:flutter_app/ui/profile/profile_info.dart';
import 'package:flutter_app/ui/profile/widgets/book_widget.dart';
import 'package:flutter_app/ui/profile/widgets/emojis_widgets.dart';
import 'package:flutter_app/ui/profile/widgets/small_win_widget.dart';
import 'package:flutter_app/ui/profile/widgets/tags_widget.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  ProfilePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ProfileState();
  }
}

class ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        body: new CustomScrollView(slivers: <Widget>[
      new SliverList(
        delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index > 4) {
              return null;
            } 
            else if (index == 0) {
              return ProfileInfo();
            }
            else if (index == 1) {
              return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: TagsWidget(),
                      width: MediaQuery.of(context).size.width));
            } 
            else if (index == 2) {
              return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: EmojisWidget(),
                      width: MediaQuery.of(context).size.width));
            }
            else if (index == 3) {
              return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: SmallWinWidget(),
                      width: MediaQuery.of(context).size.width));
            } 
            else {
              return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: BookWidget(),
                      width: MediaQuery.of(context).size.width));
            }
          },
        ),
      )
    ]));
  }
}
