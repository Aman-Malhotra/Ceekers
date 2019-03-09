import 'package:flushbar/flushbar.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 15,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Add Suggestions  :"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pop(context);
          Flushbar()
            ..message = "Feedback Submitted."
            ..duration = Duration(seconds: 2)
            ..backgroundColor = Theme.of(context).primaryColor
            ..show(context);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
