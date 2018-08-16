import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/bloc/profile_bloc.dart';
import 'package:flutter_app/models/profile_model.dart';
import 'package:flutter_app/ui/profile/widgets/photo_viewer.dart';
import 'dart:convert';

class SmallWinWidget extends StatefulWidget {
  final ProfileBloc bloc;
  SmallWinWidget(this.bloc, {Key key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() {
    return SmallWinState();
  }

}

class SmallWinState extends State<SmallWinWidget> {
  @override
  Widget build(BuildContext context) {
        return StreamBuilder(
        stream: widget.bloc.profileSmallWin,
        builder: (context, snapshot) {
          SmallWin smallWindWidgetInfo = snapshot.data;

          return new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(utf8.decode([0xF0, 0x9F, 0x93, 0x8B]) +
                      ' ' +
                      smallWindWidgetInfo.title),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                height: 120.0,
                child:
                    new SmallWinWidgetPhotoList(widget.bloc),
              )
            ],
          );
        });
  }
}

class SmallWinWidgetPhotoList extends StatefulWidget {
  final ProfileBloc bloc;  
  SmallWinWidgetPhotoList(
    this.bloc, {
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SmallWinWidgetPhotoListState();
  }
}

class SmallWinWidgetPhotoListState extends State<SmallWinWidgetPhotoList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.profileSmallWinPhotos,
        builder: (context, snapshot) {
          List<String> photos = snapshot.data;
          return new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return new RoundedCornerImage(photos[index]);
            }
          );
        });
  }
}

class RoundedCornerImage extends StatelessWidget {
  final String imageEncoded;

  const RoundedCornerImage(this.imageEncoded,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var bytes = BASE64.decode(imageEncoded);
    var image = Image.memory(
        bytes, fit: BoxFit.scaleDown);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    new PhotoViewer(image: image)));
      },
      child: Hero(
        tag: image.image,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: image,
          ),
        ),
      ),
    );
  }
}
