import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/profile_bloc.dart';
import 'package:flutter_app/models/profile_model.dart';
import 'package:flutter_app/ui/colors.dart';

class ProfileInfo extends StatefulWidget {
  final ProfileBloc bloc;
  ProfileInfo(this.bloc, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileInfoState();
  }
}

class ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.currentProfile,
        builder: (context, snapshot) {
          Profile profile = snapshot.data;

          if (profile == null) {
            return new Container();
          }

          return new Stack(children: <Widget>[
            new ProfileCoverPicture(profile.cover),
            Padding(
                padding: const EdgeInsets.only(
                    top: 170.0, left: 8.0, right: 8.0, bottom: 4.0),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.person_add),
                          onPressed: dummy,
                          color: MyColors.cyan,
                        ),
                        SizedBox(
                          height: 32.0,
                          child: new OutlineButton(
                              onPressed: dummy,
                              child: Text("Message",
                                  style:
                                      TextStyle(fontSize: 16.0, color: MyColors.cyan)),
                              borderSide: BorderSide(color: MyColors.cyan, width: 2.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 2.0),
                    child: Row(
                      children: <Widget>[
                        buildProfileName(profile.name),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Row(
                      children: <Widget>[
                        buildProfileJob(profile.job),
                        buildProfileCompany(profile.company)
                      ],
                    ),
                  )
                ])),
            new Positioned(
                top: 124.0,
                left: 30.0,
                child: new ProfilePicture(profile.photo)),
          ]);
        });
  }

  Text buildProfileName(String profileName) {
    return new Text(profileName,
        style: TextStyle(
            color: MyColors.cyan, fontWeight: FontWeight.w600, fontSize: 24.0));
  }

  Text buildProfileJob(String profileJob) {
    return new Text(profileJob + ' ',
        style: TextStyle(
            color: MyColors.cyan, fontWeight: FontWeight.w600, fontSize: 16.0));
  }

  Text buildProfileCompany(String profileCompany) {
    return new Text(' @ ' + profileCompany,
        style: TextStyle(
            color: MyColors.deepPurple, fontWeight: FontWeight.w600, fontSize: 16.0));
  }

  void dummy() {
    widget.bloc.setProfileId.add('correia.tssc');
  }
}

class ProfilePicture extends StatelessWidget {
  final String profilePicture;

  const ProfilePicture(this.profilePicture, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bytes = base64Decode(this.profilePicture);

    return Container(
      padding: EdgeInsets.all(6.0),
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
      child: new CircleAvatar(
        radius: 40.0,
        backgroundImage: Image.memory(bytes).image,
      ),
    );
  }
}

class ProfileCoverPicture extends StatelessWidget {
  final String image;

  ProfileCoverPicture(this.image, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bytes = base64Decode(this.image);
    return new Image.memory(bytes,
        fit: BoxFit.cover,
        height: 170.0,
        width: MediaQuery.of(context).size.width);
  }
}
