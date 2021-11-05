import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcard/src/model/FlashCard_model.dart';
import 'package:flashcard/src/model/Topic.dart';
import 'package:flashcard/src/resource/About.dart';

import 'package:flashcard/src/resource/FlashCard.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  //topic

  //business
  List<Flash_Card> newListBusiness = [];
  Flash_Card? business;
  List<Topic> newListTopicBusiness = [];
  Topic? topicBusiness;

  //negotiation
  List<Flash_Card> newListNegotiation = [];
  Flash_Card? negotiation;
  List<Topic> newListTopicNeogotiation = [];
  Topic? topicNeotiation;
  //economic
  List<Flash_Card> newListEconomic = [];
  Flash_Card? economic;
  List<Topic> newListTopicEconomic = [];
  Topic? topicEconomic;
//buil cardtopic
  Widget _buildCardTopic({required String image, required String name}) {
    return Card(
      color: Color(0xffe5ebe7),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
              child: Container(
                width: 100,
                height: 100,
                //tạo viền cho hình
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                //làm ảnh thành hình tròn
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      image, //ảnh topic
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Text(
              name, // tên topic
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

//build card negotiation và navigator
  Widget _buildTopicNegotiation() {
    //build topic
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('topic')
            .doc('OHoYMlugEvSqutxOcLSr')
            .collection('negotiation')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          //duyệt phần tử trong snapshot gán vào List
          snapshot.data!.docs.forEach((element) {
            topicNeotiation =
                Topic(name: element['name'], image: element['image']);
            newListTopicNeogotiation.add(topicNeotiation!);
          });

          return Expanded(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        children: newListTopicNeogotiation
                            .map(
                              (e) =>
                                  //topic negotiation
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('category')
                                          .doc('7T11BTgTbgSBx11fubMO')
                                          .collection('flashcard')
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          return Text('Something went wrong');
                                        }

                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text("Loading");
                                        }
                                        snapshot.data!.docs.forEach((element) {
                                          negotiation = Flash_Card(
                                              name: element["name"],
                                              spell: element["spell"],
                                              translation:
                                                  element["translation"],
                                              example: element["example"],
                                              image: element["image"], 
                                              isFavoric: element["isFavoric"]);
                                          newListNegotiation.add(negotiation!);
                                        });

                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FlashCard(
                                                                name:
                                                                    'Negotiation',
                                                                snapshot:
                                                                    newListNegotiation,
                                                              )));
                                            },
                                            child: _buildCardTopic(
                                                image: e.image, name: e.name));
                                      }),
                            )
                            .toList())),
              ],
            ),
          );
        });
  }

// build card economic và navigator
  Widget _buildTopicEconomic() {
    //build topic
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('topic')
            .doc('OHoYMlugEvSqutxOcLSr')
            .collection('economic')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          //duyệt phần tử trong snapshot gán vào List
          snapshot.data!.docs.forEach((element) {
            topicEconomic =
                Topic(name: element['name'], image: element['image']);
            newListTopicEconomic.add(topicEconomic!);
          });

          return Expanded(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        children: newListTopicEconomic
                            .map(
                              (e) =>
                                  //topic negotiation
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('category')
                                          .doc('SwmaTecJX7Hbjmk46NSS')
                                          .collection('flashcard')
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          return Text('Something went wrong');
                                        }

                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text("Loading");
                                        }
                                        snapshot.data!.docs.forEach((element) {
                                          economic = Flash_Card(
                                              name: element["name"],
                                              spell: element["spell"],
                                              translation:
                                                  element["translation"],
                                              example: element["example"],
                                              image: element["image"], 
                                              isFavoric: element["isFavoric"]);
                                          newListEconomic.add(economic!);
                                        });

                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FlashCard(
                                                                name:
                                                                    'contract',
                                                                snapshot:
                                                                    newListEconomic,
                                                              )));
                                            },
                                            child: _buildCardTopic(
                                                image: e.image, name: e.name));
                                      }),
                            )
                            .toList())),
              ],
            ),
          );
        });
  }

  Widget _buildTopicBusiness() {
    //build topic
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('topic')
            .doc('OHoYMlugEvSqutxOcLSr')
            .collection('marketing')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          //duyệt phần tử trong snapshot gán vào List
          snapshot.data!.docs.forEach((element) {
            topicBusiness =
                Topic(name: element['name'], image: element['image']);
            newListTopicEconomic.add(topicBusiness!);
          });

          return Expanded(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        children: newListTopicEconomic
                            .map(
                              (e) =>
                                  //topic negotiation
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('category')
                                          .doc('lqrB34furDjc6cgOKmla')
                                          .collection('flashcard')
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          return Text('Something went wrong');
                                        }

                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text("Loading");
                                        }
                                        snapshot.data!.docs.forEach((element) {
                                          business = Flash_Card(
                                              name: element["name"],
                                              spell: element["spell"],
                                              translation:
                                                  element["translation"],
                                              example: element["example"],
                                              image: element["image"], 
                                              isFavoric: element["isFavoric"]);
                                          newListBusiness.add(business!);
                                        });

                                        return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              FlashCard(
                                                                name:
                                                                    'business',
                                                                snapshot:
                                                                    newListBusiness,
                                                              )));
                                            },
                                            child: _buildCardTopic(
                                                image: e.image, name: e.name));
                                      }),
                            )
                            .toList())),
              ],
            ),
          );
        });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: Drawer(
          child: _builDrawer(),
        ),
        appBar: AppBar(
          title: Text("Learn English with Flashcards"),
          leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: 27,
            ),
          ),
        ),
        body: Center(
            child: ListView(
          children: [
            _buildTopicNegotiation(),
            // _buildTopicBusiness(),
            _buildTopicEconomic(),
          ],
        )));
  }

  Widget _builDrawer() {
    return ListView(children: [
      UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/userImage.png"),
          ),
          accountName: Text(
            "Thiên Tú",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          accountEmail: Text("thientu9562@gmail.com",
              style: TextStyle(fontSize: 12, color: Colors.black))),
      ListTile(
        selected: true,
        onTap: () {},
        leading: Icon(Icons.home),
        title: Text("Home"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(Icons.task),
        title: Text("NoteBook"),
      ),
      ListTile(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => About()));
        },
        leading: Icon(Icons.info),
        title: Text("About"),
      ),
      ListTile(
        onTap: () {},
        leading: Icon(Icons.exit_to_app),
        title: Text("Log out"),
      )
    ]);
  }
}
