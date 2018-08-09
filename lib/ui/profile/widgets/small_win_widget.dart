import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:convert';

class SmallWinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(utf8.decode([0xF0, 0x9F, 0x93, 0x8B]) +
                  ' Design Sprint PRODAP (11/08)'),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                      'https://images.pexels.com/photos/7096/people-woman-coffee-meeting.jpg?cs=srgb&dl=advice-advise-advisor-7096.jpg&fm=jpg',
                      fit: BoxFit.scaleDown),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                      'https://images.pexels.com/photos/1080865/pexels-photo-1080865.jpeg?cs=srgb&dl=adult-analyzing-brainstorming-1080865.jpg&fm=jpg',
                      fit: BoxFit.scaleDown),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                      'https://images.pexels.com/photos/1059114/pexels-photo-1059114.jpeg?cs=srgb&dl=adult-african-announcement-1059114.jpg&fm=jpg',
                      fit: BoxFit.scaleDown),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'https://images.pexels.com/photos/1124065/pexels-photo-1124065.jpeg?cs=srgb&dl=accomplished-achievement-adults-1124065.jpg&fm=jpg',
                      fit: BoxFit.scaleDown),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
