import 'package:flutter/material.dart';
import 'package:gndu_project/details.dart';

class AddOrg extends StatefulWidget {
  final String title;
  AddOrg(this.title);

  _AddOrgState createState() => _AddOrgState();
}

class _AddOrgState extends State<AddOrg> {
  String note;
  bool form = false;
  TextEditingController name, email, contact, addr, city, state, zip, country;
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    contact = TextEditingController();
    addr = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    zip = TextEditingController();
    country = TextEditingController();
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
                labelText: "Add a sample note  :",
              ),
            )),
            fieldPadding(TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name  :"),
            )),
            fieldPadding(TextFormField(
              controller: addr,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Address  :"),
              maxLines: 2,
            )),
            fieldPadding(TextFormField(
              controller: city,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "City  :"),
            )),
            fieldPadding(TextFormField(
              controller: state,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "State  :"),
            )),
            fieldPadding(TextFormField(
              controller: country,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Country  :"),
            )),
            fieldPadding(TextFormField(
              controller: zip,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Zip  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              controller: contact,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Contact  :"),
              keyboardType: TextInputType.number,
            )),
            fieldPadding(TextFormField(
              controller: email,
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
