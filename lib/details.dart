import 'package:meta/meta.dart';

class Details {
  final String name, contact, email, website, zip;
  String note;
  final Loc location;
  Details(
      {@required this.name,
      @required this.contact,
      @required this.location,
      @required this.zip,
      this.website,
      this.email,
      this.note});

  updateNote(String str) {
    this.note = str;
  }
}

class Loc {
  final String city, state, country, addr;

  Loc({this.city, this.state, this.country, this.addr});
}
