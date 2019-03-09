import 'package:flutter/material.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/details.dart';

class Donate extends StatefulWidget {
  final String title;
  final DataClass d;
  final Function(Details, String) f;
  Donate(this.title, this.d, this.f);

  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  String note;
  bool form = false;
  void initState() {
    super.initState();
  }

  Widget fieldPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            fieldPadding(TextField(
              onChanged: (String str) {
                note = str;
                setState(() {});
              },
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Donate Commodities  :",
              ),
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name  :"),
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Address  :"),
              maxLines: 2,
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "City  :"),
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "State  :"),
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Country  :"),
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Zip  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Contact  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email  :",
              ),
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.send),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
