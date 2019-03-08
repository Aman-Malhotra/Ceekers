import 'package:gndu_project/details.dart';

class DataClass {
  List<Details> mainData = new List();

  initList() {
    mainData = [
      Details(
          zip: "143001",
          email: "pingalwara57@gmail.com",
          contact: "+91-1832584713",
          location: Loc(
              addr: "All India Pingalwara Charitable Society, GT Road",
              city: "Amritsar",
              state: "Punjab",
              country: "India"),
          name: "All India Pingalwara Charitable Society",
          website: "pingalwara.org",
          note: ""),
      Details(
          name: "Central Khalsa Orphanage",
          location: Loc(
            addr: "Central Khalsa Orphanage,GT Road, Putlighar",
            city: "Amritsar",
            country: "India",
            state: "Punjab",
          ),
          website: "chiefkhalsadiwan.com",
          contact: "+91-18325625312",
          zip: "143001",
          email: "",
          note: ""),
      Details(
          zip: "144008",
          email: "info@babasaupseniorcitizenhome.com",
          contact: "+91-1812253153",
          location: Loc(
              addr: "Kapurthala Chwonk, Gulab Devi Hospital Road",
              city: "Jalandhar",
              state: "Punjab",
              country: "India"),
          name: "Baba Sarup Senior Citizen Home",
          website: "babasaupseniorcitizenhome.com",
          note: ""),
      Details(
          name: "Guru Vishram Vridh Ashram",
          location: Loc(
            addr:
                "Mathura Road Gautampuri Phase/I opp. Mohan-Estate Metro Station, Badarpuri",
            city: "New Delhi",
            country: "India",
            state: "Delhi",
          ),
          website: "sheows.org",
          contact: "+91-8588888999",
          zip: "110044",
          email: "oldagehome@sheows.org",
          note: ""),
    ];
  }

  updateNote(Details d, String note) {
    Details newD = d;
    mainData.remove(d);
    newD.updateNote(note);
    mainData.add(newD);
  }

  List<Details> search(String search) {
    return mainData.where((d) {
      return d.name.toLowerCase().trim().contains(search.toLowerCase().trim())
          ? true
          : d.location.addr.toLowerCase().trim().contains(search.toLowerCase().trim())
              ? true
              : d.location.country.toLowerCase().trim().contains(search.toLowerCase().trim())
                  ? true
                  : d.location.state
                          .toLowerCase()
                          .trim()
                          .contains(search.toLowerCase().trim())
                      ? true
                      : d.location.city
                              .toLowerCase()
                              .trim()
                              .contains(search.toLowerCase().trim())
                          ? true
                          : d.zip.toLowerCase().trim().contains(search.toLowerCase().trim())
                              ? true
                              : d.website
                                      .toLowerCase()
                                      .trim()
                                      .contains(search.toLowerCase().trim())
                                  ? true
                                  : d.note
                                          .toLowerCase()
                                          .trim()
                                          .contains(search.toLowerCase().trim())
                                      ? true
                                      : d.email.toLowerCase().trim().contains(search.toLowerCase().trim())
                                          ? true
                                          : d.contact
                                                  .toLowerCase()
                                                  .trim()
                                                  .contains(search.toLowerCase().trim())
                                              ? true
                                              : false;
    }).toList();
  }
}
