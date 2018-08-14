import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ui/profile/widgets/photo_viewer.dart';
import 'dart:convert';

class SmallWinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profileSmallWinWidgetDocument = Firestore.instance
        .collection('small_win_widget')
        .document('correia.tssc');

    return StreamBuilder(
        stream: profileSmallWinWidgetDocument.get().asStream(),
        builder: (context, snapshot) {
          var smallWindWidgetInfo = snapshot.data;

          return new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(utf8.decode([0xF0, 0x9F, 0x93, 0x8B]) +
                      ' ' +
                      smallWindWidgetInfo.data['title']),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                height: 120.0,
                child:
                    new SmallWinWidgetPhotoList(profileSmallWinWidgetDocument),
              )
            ],
          );
        });
  }
}

class SmallWinWidgetPhotoList extends StatelessWidget {
  const SmallWinWidgetPhotoList(
    this.document, {
    Key key,
  }) : super(key: key);

  final DocumentReference document;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: document.collection('photos').snapshots(),
        builder: (context, snapshot) {
          return new ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return new RoundedCornerImage(snapshot.data.documents[index].data['photo']);
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
                    new PhotoViewer(imageProvider: image.image)));
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
