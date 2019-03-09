import 'package:flutter/material.dart';
import 'package:gndu_project/card.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Request extends StatefulWidget {
  final String title;
  final DataClass d;
  final Function(Details, String) f;
  Request(this.title, this.d, this.f);

  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int selected = null;
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
      body: form
          ? ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                (widget.d.mainData[selected].note.length > 0)
                    ? fieldPadding(Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                "Previous Pending Requested Commodities:",
                                style: Theme.of(context).textTheme.subhead),
                          ),
                          ListTile(
                            title: Text(widget.d.mainData[selected].note.trim(),
                                style: Theme.of(context).textTheme.title),
                            trailing: IconButton(
                              icon: Icon(FontAwesomeIcons.donate),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ))
                    : Container(),
                fieldPadding(TextField(
                  onChanged: (String str) {
                    note = str;
                    setState(() {});
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Request Commodities  :",
                  ),
                )),
                fieldPadding(
                  TextFormField(
                    focusNode: FocusNode(),
                    enabled: false,
                    initialValue: widget.d.mainData[selected].name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Name Of Organiztion :"),
                  ),
                ),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].location.addr,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Address  :"),
                  maxLines: 2,
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].location.city,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "City  :"),
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].location.state,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "State  :"),
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].location.country,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Country  :"),
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].zip,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Zip  :"),
                  keyboardType: TextInputType.number,
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].contact,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Contact  :"),
                  keyboardType: TextInputType.number,
                )),
                fieldPadding(TextFormField(
                  initialValue: widget.d.mainData[selected].email,
                  enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email  :",
                  ),
                )),
                // fieldPadding(TextFormField(
                //   initialValue: widget.d.mainData[selected].note,
                //   maxLines: 10,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: "Request Commodities  :",
                //   ),
                // )),
              ],
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (c, i) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: card(widget.d.mainData[i], () {
                      selected = i;
                      form = true;
                      setState(() {});
                    }, context, NetworkImage(widget.d.mainData[i].imageUrl)));
              },
              itemCount: widget.d.mainData.length,
            ),
      floatingActionButton: form
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.send),
              onPressed: (note == null || note.length > 0)
                  ? () {
                      widget.f(
                        widget.d.mainData[selected],
                        note,
                      );
                      Navigator.pop(context);
                    }
                  : null,
            )
          : Container(),
    );
  }
}
