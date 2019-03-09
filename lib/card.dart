import 'package:flutter/material.dart';
import 'package:gndu_project/details.dart';

Widget card(Details d, Function fn, BuildContext c, ImageProvider image) {
  return FlatButton(
    padding: EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    color: Theme.of(c).primaryColor,
    child: Container(
      height: MediaQuery.of(c).size.height * 0.15,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(c).primaryColor,
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              image: image),
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: d.name,
            child: Material(
              color: Colors.transparent,
              child: Text(
                d.name,
                textAlign: TextAlign.center,
                style: Theme.of(c).textTheme.subtitle.copyWith(fontSize: 20.0),
              ),
            ),
          ),
          Text(
            (d.location.city != null && d.location.state != null)
                ? "${d.location.city}, ${d.location.state} ${d.zip}"
                : "NAN",
            textAlign: TextAlign.start,
            style:
                Theme.of(c).textTheme.subhead.copyWith(color: Colors.white70),
          ),
        ],
      ),
    ),
    onPressed: () {
      fn();
    },
  );
}
