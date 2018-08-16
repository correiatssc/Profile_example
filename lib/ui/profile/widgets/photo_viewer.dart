import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final Image image;

  const PhotoViewer({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Hero(
      tag: image.image,
      child: PhotoView(
        imageProvider: image.image,
        backgroundColor: Colors.black,
        loadingChild: Container(),
        minScale: PhotoViewScaleBoundary.contained,
        maxScale: PhotoViewScaleBoundary.covered,
      ),
    );
  }
}
