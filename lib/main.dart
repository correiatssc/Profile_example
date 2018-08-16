import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/profile_bloc.dart';
import 'package:flutter_app/ui/profile/profile.dart';

void main() {
  final profileBloc = new ProfileBloc();
  profileBloc.setProfileId.add('correia.tssc');
  runApp(new MyApp(profileBloc));}

class MyApp extends StatelessWidget {
  final ProfileBloc profileBloc;
  MyApp(this.profileBloc, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter',
      theme: new ThemeData(
        fontFamily: 'Raleway',
        backgroundColor: Color(0xFFFFFFFF),
        primarySwatch: Colors.blue,
      ),
      home: new ProfilePage(profileBloc: profileBloc)
    );
  }
}