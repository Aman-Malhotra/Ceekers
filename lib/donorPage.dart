import 'package:flutter/material.dart';
import 'package:gndu_project/details.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorPage extends StatefulWidget {
  final Donation d;
  DonorPage({this.d});

  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  Future<void> _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.d.name,
          child: Material(
            child: Text(
              widget.d.name,
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle,
            ),
            color: Colors.transparent,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.call,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
            title: Text(
              widget.d.contact,
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {
              _launch("tel:${widget.d.contact}");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.mail,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
            title: Text(
              (widget.d.email != null) ? "${widget.d.email}" : "NAN",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {
              _launch("${widget.d.email}");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  (widget.d.location.addr != null)
                      ? "${widget.d.location.addr}"
                      : "NAN",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  (widget.d.location.city != null)
                      ? "${widget.d.location.city}"
                      : "NAN",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  (widget.d.location.state != null)
                      ? "${widget.d.location.state}"
                      : "NAN",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  (widget.d.location.country != null)
                      ? "${widget.d.location.country} - ${widget.d.zip}"
                      : "NAN",
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Contribution",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.note,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
            title: Text(
              (widget.d.note != null) ? "${widget.d.note}" : "NAN",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
