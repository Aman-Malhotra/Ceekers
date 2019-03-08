import 'package:flutter/material.dart';
import 'package:gndu_project/card.dart';
import 'package:gndu_project/data.dart';
import 'package:gndu_project/details.dart';
import 'package:gndu_project/orgPage.dart';

class Search extends SearchDelegate {
  final DataClass d;
  List<Details> newD;
  final BuildContext c;
  Search(this.d, this.c) {
    newD = d.search("");
  }
  search() {
    newD = d.search(query);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Hero(
      tag: "Back",
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (c, i) {
        return Card(child: card(newD[i].name, () {}, context));
      },
      itemCount: newD.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    search();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (c, i) {
        return Card(
            child: card(newD[i].name, () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrgPage(
                        d: newD[i],
                      )));
        }, context));
      },
      itemCount: newD.length,
    );
  }
}
