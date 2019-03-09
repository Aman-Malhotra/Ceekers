import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  final Widget child;

  AboutUs({Key key, this.child}) : super(key: key);

  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 20.0, color: Colors.white
                )),
      ),
    );
  }
}
