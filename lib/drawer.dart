import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gndu_project/DrawerPages/Suggest.dart';
import 'package:gndu_project/DrawerPages/aboutUs.dart';
import 'package:gndu_project/DrawerPages/work.dart';

class DrawerMain extends StatefulWidget {
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Material(
              color: Theme.of(context).primaryColor,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.073,
                child: Center(
                  child: Text("BIG-HEARTED",
                      style: Theme.of(context).textTheme.subtitle),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("How does it work ?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.grey, letterSpacing: 1.5)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Working()));
              },
            ),
            ListTile(
              leading: Icon(Icons.face),
              title: Text("About Us",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.grey, letterSpacing: 1.5)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline),
              title: Text("Suggestions",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.grey, letterSpacing: 1.5)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Suggest()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.donate),
              title: Text("Contribute",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Colors.grey, letterSpacing: 1.5)),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => Working()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
