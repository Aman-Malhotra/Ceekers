import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gndu_project/addOrg.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/details.dart';
import 'package:gndu_project/donatePage.dart';
import 'package:gndu_project/donations.dart';
import 'package:gndu_project/donorPage.dart';
import 'package:gndu_project/drawer.dart';
import 'package:gndu_project/imageContainer.dart';
import 'package:gndu_project/orgPage.dart';
import 'package:gndu_project/requestPage.dart';
import 'package:gndu_project/requests.dart';
import 'package:gndu_project/search.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Color.fromRGBO(220, 20, 60, 1),
      statusBarColor: Colors.teal,
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
          // primaryColor: Color.fromRGBO(220, 20, 60, 1),
          primaryColor: Colors.teal,
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

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  DataClass d;
  List<Details> sampleList = new List();
  bool load = false;
  AnimationController controller;
  Animation animation;
  void initState() {
    super.initState();
    d = new DataClass();
    d.initList();
    d.mainData.forEach((a) {
      if (a.note.trim().length > 0) {
        sampleList.add(a);
      }
    });
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(curve: Curves.linear, parent: controller));
    controller.forward();
    Timer t = new Timer(Duration(milliseconds: 1500), () {
      load = true;
      setState(() {});
    });
  }

  updateDonation(Donation don) {
    d.addDonation(don);
    setState(() {});
  }

  updateData(Details details, String note) {
    d.updateNote(details, note);
    sampleList = [];
    d.mainData.forEach((a) {
      if (a.note.trim().length > 0) {
        sampleList.add(a);
      }
    });
    setState(() {});
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
    return (load)
        ? Scaffold(
            drawer: DrawerMain(),
            appBar: AppBar(
                title: GestureDetector(
                  child: MainAppBar(),
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: Search(d, context),
                        query: "");
                  },
                ),
                automaticallyImplyLeading: false,
                elevation: 0.0),
            body: ListView(
              physics: BouncingScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Text("\"HEARTS Grow with GIVING\"",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontSize: 24.0,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.heart,
                            color: Theme.of(context).primaryColor,
                            size: 40.0,
                          ),
                          Icon(
                            FontAwesomeIcons.chartLine,
                            color: Theme.of(context).primaryColor,
                            size: 40.0,
                          ),
                          Icon(
                            FontAwesomeIcons.handHolding,
                            color: Theme.of(context).primaryColor,
                            size: 40.0,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Request(
                                        "REQUEST COMMODITIES", d, updateData)));
                          },
                          child: imageContainer(
                              Text("REQUEST",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .copyWith(fontSize: 22.0)),
                              AssetImage("assets/b.jpg"),
                              context,
                              0.2),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Donate(
                                        "DONATE COMMODITIES",
                                        d,
                                        updateData,
                                        updateDonation)));
                          },
                          child: imageContainer(
                              Text("DONATE",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .copyWith(fontSize: 22.0)),
                              AssetImage("assets/a.jpg"),
                              context,
                              0.2),
                        ),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text("Requests",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(fontSize: 20.0, color: Colors.black)),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (c, i) {
                        if (i == 2)
                          return FlatButton(
                            child: Icon(FontAwesomeIcons.angleDown),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Requests(sampleList);
                              }));
                            },
                          );
                        return ListTile(
                          leading: Icon(FontAwesomeIcons.handHolding),
                          title: Text("${sampleList[i].name}'s :"),
                          subtitle: Text(
                            "${sampleList[i].note}",
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrgPage(
                                          d: sampleList[i],
                                        )));
                          },
                        );
                      },
                      itemCount: 3,
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text("Donations",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(fontSize: 20.0, color: Colors.black)),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (c, i) {
                        if (i == 2)
                          return FlatButton(
                            child: Icon(FontAwesomeIcons.angleDown),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Donations(d);
                              }));
                            },
                          );
                        return ListTile(
                          leading: Icon(FontAwesomeIcons.handsHelping),
                          title: Text("${d.donList[i].name}'s :"),
                          subtitle: Text(
                            "${d.donList[i].note}",
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonorPage(
                                          d: d.donList[i],
                                        )));
                          },
                        );
                      },
                      itemCount: 3,
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddOrg("Add Organization")));
              },
              child: Icon(Icons.add, size: 35.0),
            ),
          )
        : Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: animation,
                      builder: (c, w) {
                        print(animation.value);
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            "assets/logo.jpg",
                            height: MediaQuery.of(context).size.height *
                                0.25 *
                                animation.value,
                            width: MediaQuery.of(context).size.height *
                                0.25 *
                                animation.value,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    Text(
                      "BIG-HEARTED",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.teal, fontSize: 30.0),
                    ),
                  ],
                ),
              ),
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
                ))
          ],
        ),
      ),
    );
  }
}
