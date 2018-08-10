import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  final ImageProvider imageProvider;

  const PhotoViewer({Key key, this.imageProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Hero(
      tag: imageProvider,
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundColor: Colors.black,
        loadingChild: Container(),
        minScale: PhotoViewScaleBoundary.contained,
        maxScale: PhotoViewScaleBoundary.covered,
      ),
    );
  }
}
