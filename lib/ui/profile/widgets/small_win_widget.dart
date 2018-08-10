import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ui/profile/widgets/photo_viewer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:convert';

class SmallWinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(utf8.decode([0xF0, 0x9F, 0x93, 0x8B]) +
                ' Design Sprint PRODAP (11/08)'),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          height: 136.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new RoundedCornerImage(
                  imageUri:
                      'https://images.pexels.com/photos/7096/people-woman-coffee-meeting.jpg?cs=srgb&dl=advice-advise-advisor-7096.jpg&fm=jpg'),
              new RoundedCornerImage(
                  imageUri:
                      'https://images.pexels.com/photos/1080865/pexels-photo-1080865.jpeg?cs=srgb&dl=adult-analyzing-brainstorming-1080865.jpg&fm=jpg'),
              new RoundedCornerImage(
                  imageUri:
                      'https://images.pexels.com/photos/1059114/pexels-photo-1059114.jpeg?cs=srgb&dl=adult-african-announcement-1059114.jpg&fm=jpg'),
              new RoundedCornerImage(
                  imageUri:
                      'https://images.pexels.com/photos/1124065/pexels-photo-1124065.jpeg?cs=srgb&dl=accomplished-achievement-adults-1124065.jpg&fm=jpg'),
            ],
          ),
        )
      ],
    );
  }
}

class RoundedCornerImage extends StatelessWidget {
  final String imageUri;

  const RoundedCornerImage({Key key, this.imageUri}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    var image = FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUri,
                fit: BoxFit.scaleDown);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new PhotoViewer(imageProvider: image.image)));
      },
      child: Hero(
        tag: image.image,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: image,
          ),
        ),
      ),
    );
  }
}
