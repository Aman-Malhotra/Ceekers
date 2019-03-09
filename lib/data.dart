import 'package:gndu_project/details.dart';

class DataClass {
  List<Details> mainData = new List();
  List<Donation> donList = new List();

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
          imageUrl:
              "https://images.tribuneindia.com/cms/gall_content/2017/10/2017_10\$largeimg14_Saturday_2017_012651467.jpg",
          note: "Groceries required."),
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
          imageUrl:
              "http://www.asrcharitabletrust.com/wp-content/gallery/orphanage/results-day.jpg",
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
          imageUrl:
              "https://akm-img-a-in.tosshub.com/indiatoday/the-elderly-may7-1_647_042718011551.jpg?lrxSI3XiUX9TEEKe8uBoSQlrsLeJngfQ.jpg",
          note: "Clothes for children under 10."),
      Details(
          name: "Guru Vishram Vridh Ashram",
          location: Loc(
            addr:
                "Mathura Road Gautampuri Phase-I opp. Mohan-Estate Metro Station, Badarpuri",
            city: "New Delhi",
            country: "India",
            state: "Delhi",
          ),
          website: "sheows.org",
          contact: "+91-8588888999",
          zip: "110044",
          email: "oldagehome@sheows.org",
          imageUrl:
              "https://d2zcpk7yfyf2dq.cloudfront.net/milaap/image/upload/s--lqK88eyM--/c_fill,e_viesus_correct,g_faces,h_452,w_603/v1492813074/production/images/campaign/Oldagehome_1492785874_1492813071.jpg",
          note: "Chairs needed."),
    ];
    mainData
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    donList = [
      Donation(
          contact: "9464262941",
          location: Loc(
              addr: "Gopal Park",
              city: "Kapurthala",
              country: "India",
              state: "Punjab"),
          name: "Aman Malhotra",
          zip: "144601",
          email: "aman9464262941@gmail.com",
          note: " 2 tShirts and 2 pair of shoes."),
      Donation(
          contact: "946151141",
          location: Loc(
              addr: "Model town",
              city: "Jalandhar",
              country: "India",
              state: "Punjab"),
          name: "Sahil Sharma",
          zip: "144602",
          email: "",
          note: "1 bicycle and 2 buckets."),
      Donation(
          contact: "9463256441",
          location: Loc(
              addr: "Urban Estate",
              city: "Patiala",
              country: "India",
              state: "Punjab"),
          name: "Jujhar Singh",
          zip: "147002",
          email: "jjsingh1998@yahoo.com",
          note: "Food and some groceries."),
    ];
  }

  updateNote(Details d, String note) {
    Details newD = d;
    mainData.remove(d);
    newD.updateNote(note);
    mainData.add(newD);
    mainData
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  addDonation(Donation d) {
    donList.add(d);
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
