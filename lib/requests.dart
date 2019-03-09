import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gndu_project/details.dart';

class Requests extends StatefulWidget {
  final List<Details> d;
  Requests(this.d);

  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Requests",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (c, i) {
            return ListTile(
                leading: Icon(FontAwesomeIcons.handHolding),
                title: Text("${widget.d[i].name}'s :"),
                subtitle: Text(
                  "${widget.d[i].note}",
                ));
          },
          itemCount: widget.d.length,
        ));
  }
}
