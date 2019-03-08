import 'package:flutter/material.dart';

TextStyle listTileTitleStyle(context) {
  return TextStyle(
    letterSpacing: 2.0,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  );
}

TextStyle listTileSubtitleStyle(context) {
  return TextStyle(
    letterSpacing: 1.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle appBarTextStyle(context, {double size, FontWeight weight}) {
  return TextStyle(
    letterSpacing: 1.0,
    fontSize: (size != null) ? size : 16.0,
    color: Colors.grey.shade600,
    fontWeight: weight != null ? weight : FontWeight.w500,
  );
}

TextStyle normalTextStyle(context) {
  return TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle headingTextStyle(context) {
  return TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle overImageTitle() {
  return TextStyle(
      color: Colors.white,
      letterSpacing: 1.5,
      fontWeight: FontWeight.w500,
      fontSize: 20.0);
}

TextStyle overImageSubtitle() {
  return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0,
      fontSize: 17.0);
}

double iconSize() {
  return 20.0;
}
