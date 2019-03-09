import 'package:flutter/material.dart';

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
                  child: Text("Donation App",
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
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
