import 'package:flutter/material.dart';
import 'package:gndu_project/details.dart';
import 'package:url_launcher/url_launcher.dart';

class OrgPage extends StatefulWidget {
  final Details d;
  OrgPage({this.d});

  _OrgPageState createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
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
              Icons.open_in_browser,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
            title: Text(
              (widget.d.website != null)
                  ? "https://www.${widget.d.website}"
                  : "NAN",
              style: Theme.of(context).textTheme.subhead,
            ),
            onTap: () {
              _launch("https://www.${widget.d.website}");
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
        ],
      ),
    );
  }
}
