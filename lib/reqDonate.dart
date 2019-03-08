import 'package:flutter/material.dart';
import 'package:gndu_project/card.dart';
import 'package:gndu_project/data.dart';

class RequestDonate extends StatefulWidget {
  final String title;
  final DataClass d;
  RequestDonate(this.title, this.d);

  _RequestDonateState createState() => _RequestDonateState();
}

class _RequestDonateState extends State<RequestDonate> {
  List<DropdownMenuItem> list= new List();
  void initState() { 
    super.initState();
    initList();
  }
  Widget fieldPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: child,
    );
  }

  initList(){
    widget.d.mainData.map((d){
      list.add(DropdownMenuItem());
    }).toList();
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
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          fieldPadding(DropdownButton(
            items: ,
          )),
          fieldPadding(
            TextFormField(
              focusNode: FocusNode(),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name Of Organiztions :"),
            ),
          ),
          fieldPadding(TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Age  :"),
            keyboardType: TextInputType.number,
          )),
          fieldPadding(TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Blood Group  :"),
          )),
          fieldPadding(TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Location  :"),
          )),
          fieldPadding(TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Contact  :",
            ),
            keyboardType: TextInputType.number,
          )),
          fieldPadding(TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email  :",
            ),
          )),
          fieldPadding(TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Add Note  :",
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.send),
        onPressed: () {},
      ),
    );
  }
}
