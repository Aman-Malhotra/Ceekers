import 'package:flutter/material.dart';

class Working extends StatefulWidget {
  final Widget child;

  Working({Key key, this.child}) : super(key: key);

  _WorkingState createState() => _WorkingState();
}

class _WorkingState extends State<Working> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How does it work ?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 20.0, color: Colors.white)),
      ),
    );
  }
}
