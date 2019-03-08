import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/reqDonate.dart';
import 'package:gndu_project/search.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(220, 20, 60, 1),
      statusBarIconBrightness: Brightness.dark));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
      theme: ThemeData(
          primaryColor: Color.fromRGBO(220, 20, 60, 1),
          textTheme: TextTheme(
            title: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                letterSpacing: 2.0,
                fontFamily: "Nuninto"),
            subtitle: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                letterSpacing: 2.0,
                fontFamily: "Nuninto"),
            subhead: TextStyle(
                fontSize: 17.0,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}

class Main extends StatefulWidget {
  final Widget child;

  Main({Key key, this.child}) : super(key: key);

  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  DataClass d;
  void initState() {
    super.initState();
    d = new DataClass();
    d.initList();
  }

  Widget card(String text, Function fn) {
    return Expanded(
      flex: 1,
      child: Card(
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.all(10.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontSize: 20.0)),
              alignment: AlignmentDirectional.center,
            ),
            onPressed: () {
              fn();
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          title: GestureDetector(
            child: MainAppBar(),
            onTap: () {
              showSearch(
                  context: context, delegate: Search(d, context), query: "");
            },
          ),
          automaticallyImplyLeading: false,
          elevation: 0.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              card("REQUEST", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RequestDonate("REQUEST COMMODITIES", d)));
              }),
              card("DONATE", () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RequestDonate("DONATE COMMODITIES", d)));
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: AlignmentDirectional.center,
        height: MediaQuery.of(context).size.height * 0.055,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "Back",
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Search here",
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      fontSize: 16.0),
                ),
              ),
              flex: 9,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
