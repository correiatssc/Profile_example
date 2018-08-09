import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProfileInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProfileInfoState();
  }
}

class ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: <Widget>[
          new Stack(children: <Widget>[
            Container(
                child: Column(
              children: <Widget>[
                new ProfileCoverPicture(
                    imageUri:
                        'https://images.pexels.com/photos/348523/pexels-photo-348523.jpeg?cs=srgb&dl=beach-blur-close-up-348523.jpg&fm=jpg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 24.0,
                      child: new OutlineButton(
                          onPressed: dummy,
                          child: Text("Message",
                              style: TextStyle(color: Colors.cyan)),
                          borderSide:
                              BorderSide(color: Colors.cyan, width: 2.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)))),
                    ),
                    new IconButton(
                      icon: Icon(Icons.person_add),
                      onPressed: dummy,
                      color: Colors.cyan,
                    )
                  ],
                )
              ],
            )),
            new Positioned(
                top: 156.0,
                left: 20.0,
                child: new ProfilePicture(
                    profilePictureUri:
                        'https://images.pexels.com/photos/842567/pexels-photo-842567.jpeg?cs=srgb&dl=adult-beard-blur-842567.jpg&fm=jpg'))
          ]),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: Row(
              children: <Widget>[
                buildProfileName(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
            child: Row(
              children: <Widget>[
                buildProfileOccupation(),
                buildProfileEmployee()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildProfileEmployee() {
    return new Text(' @ dti digital',
        style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
            fontSize: 14.0));
  }

  Text buildProfileOccupation() {
    return new Text('Software Engineer ',
        style: TextStyle(
            color: Colors.cyan, fontWeight: FontWeight.w600, fontSize: 14.0));
  }

  Text buildProfileName() {
    return new Text('Thalisson Correia',
        style: TextStyle(
            color: Colors.cyan, fontWeight: FontWeight.bold, fontSize: 18.0));
  }

  void dummy() {}
}

class ProfilePicture extends StatelessWidget {
  final String profilePictureUri;

  const ProfilePicture({this.profilePictureUri, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFFFFF)),
      child: new CircleAvatar(
        radius: 40.0,
        backgroundImage: NetworkImage(
          profilePictureUri),
      ),
    );
  }
}

class ProfileCoverPicture extends StatelessWidget {
  final String imageUri;

  ProfileCoverPicture({this.imageUri, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: this.imageUri,
        fit: BoxFit.cover,
        height: 200.0,
        width: MediaQuery.of(context).size.width);
  }
}
