import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  final Widget child;

  AboutUs({Key key, this.child}) : super(key: key);

  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String str =
      "This application is based on a No Profit No Loss fundamental and is solely being run to give back to the community that has been raising us. \n Any revenue earned will be directly given back to the welfare of the mention deeds.";
  String copyright =
      "MIT LicenseCopyright (c) 2018 Aman Malhotra. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to dealin the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT ABILITY,FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THEAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHERLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.";
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
          title: Text("About Us",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontSize: 20.0, color: Colors.white)),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(str,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontSize: 18.0, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Contact Us :-",
                  softWrap: true,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontSize: 18.0, color: Theme.of(context).primaryColor)),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
              title: Text(
                "9826462526",
                style: Theme.of(context).textTheme.subhead,
              ),
              onTap: () {
                _launch("tel:9826462526");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Theme.of(context).primaryColor,
                size: 30.0,
              ),
              title: Text(
                "abc@gmail.com",
                style: Theme.of(context).textTheme.subhead,
              ),
              onTap: () {},
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
                    "Guru Nanak Dev University, GT Road",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    "Amritsar",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    "Punjab",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    "India - 143005",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Copyright :-",
                  softWrap: true,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                      fontSize: 18.0, color: Theme.of(context).primaryColor)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                copyright,
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.subhead,
              ),
            )
          ],
        ));
  }
}
