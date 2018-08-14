import 'package:flutter/material.dart';
import 'package:flutter_app/ui/profile/profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        fontFamily: 'Raleway',
        backgroundColor: Color(0xFFFFFFFF),
        primarySwatch: Colors.blue,
      ),
      home: new ProfilePage(title: 'Momment')
    );
  }
}