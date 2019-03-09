import 'package:flutter/material.dart';

Widget imageContainer(
    Widget child, ImageProvider image, BuildContext context, double heightFactor) {
  return Container(
    alignment: AlignmentDirectional.center,
    decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            image: image),
        borderRadius: BorderRadius.circular(15.0)),
    // width: double.infinity,
    height: MediaQuery.of(context).size.height * heightFactor,
    child: Center(child: child),
  );
}
