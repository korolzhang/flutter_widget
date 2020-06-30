import 'package:flutter/material.dart';
import 'package:tinder_card/tinder_card.dart';


final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      'assets/images/a.jpg',
    ],
    name: "Aneesh G 1",
    bio: "This is the person you want",
  ),
  new Profile(
    photos: [
      'assets/images/b.jpg',
    ],
    name: "Aneesh G 2",
    bio: "This is the person you want",
  ),
  new Profile(
    photos: [
      'assets/images/c.jpg',
    ],
    name: "Aneesh G 3",
    bio: "This is the person you want",
  ),
  new Profile(
    photos: [
      'assets/images/a.jpg',
    ],
    name: "Aneesh G 4",
    bio: "This is the person you want",
  ),
];
class TinderCardPage extends StatefulWidget {
  @override
  _TinderCardPageState createState() => _TinderCardPageState();
}

class _TinderCardPageState extends State<TinderCardPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TinderCard"),
      ),
      body: TinderSwapCard(
        demoProfiles: demoProfiles,
        myCallback: (decision)=>print("decision=>$decision"),
      ),
    );
  }
}

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}
