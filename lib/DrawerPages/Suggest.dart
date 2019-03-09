import 'package:flutter/material.dart';

class Suggest extends StatefulWidget {
  final Widget child;

  Suggest({Key key, this.child}) : super(key: key);

  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Give Suggestions",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontSize: 20, color: Colors.white)),
      ),
    );
  }
}
