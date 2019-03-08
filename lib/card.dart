import 'package:flutter/material.dart';

Widget card(String text, Function fn, BuildContext c) {
  return FlatButton(
    color: Theme.of(c).primaryColor,
    child: Container(
      height: MediaQuery.of(c).size.height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: text,
            child: Material(
              color: Colors.transparent,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(c).textTheme.subtitle,
              ),
            ),
          ),
        ],
      ),
    ),
    onPressed: () {
      fn();
    },
  );
}
