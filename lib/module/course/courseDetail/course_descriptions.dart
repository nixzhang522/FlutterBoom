import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseDescriptions extends StatelessWidget {
  CourseDescriptions({this.width, this.descriptions});
  final double width;
  final List descriptions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      itemCount: descriptions == null ? 0 : descriptions.length,
      itemBuilder: (context, i) => renderRow(i),
    );
  }

  Widget renderRow(i) {
    var item = descriptions[i];
    var meta = item["meta"];
    double height = 200.0;
    if (meta != null) {
      var imageWidth = meta["width"].toString();
      var imageHeight = meta["height"].toString();
      if (imageWidth != null && imageHeight != null) {
        height = width * double.parse(imageHeight) / double.parse(imageWidth);
      }
    }

    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: item["src"] ?? "",
      fit: BoxFit.cover,
    );
  }
}
