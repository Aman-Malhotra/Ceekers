import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gndu_project/data.dart';

class Donations extends StatefulWidget {
  final DataClass d;
  Donations(this.d);

  _DonationsState createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("All Donations",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (c, i) {
            return ListTile(
                leading: Icon(FontAwesomeIcons.handsHelping),
                title: Text("${widget.d.donList[i].name}'s :"),
                subtitle: Text(
                  "${widget.d.donList[i].note}",
                ));
          },
          itemCount: widget.d.donList.length,
        ));
  }
}
