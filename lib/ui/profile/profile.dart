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
              return new WidgetCard(innerWidget: TagsWidget());
            } 
            else if (index == 2) {
              return new WidgetCard(innerWidget: EmojisWidget());
            }
            else if (index == 3) {
              return new WidgetCard(innerWidget: SmallWinWidget());
            } 
            else {
              return new WidgetCard(innerWidget: BookWidget());
            }
          },
        ),
      )
    ]));
  }
}

class WidgetCard extends StatelessWidget {
  final Widget innerWidget;
  
  const WidgetCard({
    Key key, this.innerWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Container(
              padding: EdgeInsets.all(12.0),
              child: innerWidget,
              width: MediaQuery.of(context).size.width)),
    );
  }
}
