import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcard/src/model/FlashCard_model.dart';
import 'package:flashcard/src/model/Topic.dart';
import 'package:flashcard/src/provider/FlashCard_topic.dart';
import 'package:flashcard/src/resource/FlashCard.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/src/provider/FlashCard_topic.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  //topic
  
  //econimic
  List<Flash_Card> newListEconomic = [];
  Flash_Card? economic;
  //negotiation
  List<Flash_Card> newListNegotiation = [];
  Flash_Card? negotiation;
  List<Topic> newListTopicNeogotiation = [];
  Topic? topicNeotiation;
  //contract
  List<Flash_Card> newListContract = [];
  Flash_Card? contract;
  List<Topic> newListTopicContract = [];
  Topic? topicContract;
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

          return  Expanded(
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
                                          AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              translation: element["translation"],
                                              example: element["example"],
                                              image: element["image"]);
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
                            .toList()
                        )),
              ],
            ),
          );
        });
  }
// build card contract và navigator
  Widget _buildTopicContract() {
    //build topic
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('topic')
            .doc('OHoYMlugEvSqutxOcLSr')
            .collection('contract')
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
            topicContract =
                Topic(name: element['name'], image: element['image']);
            newListTopicContract.add(topicContract!);
          });

          return Expanded(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                        children: newListTopicContract
                            .map(
                              (e) =>
                                  //topic negotiation
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('category')
                                          .doc('RgOwIV7v4uSLMruSc1h6')
                                          .collection('flashcard')
                                          .snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot> snapshot) {
                                        if (snapshot.hasError) {
                                          return Text('Something went wrong');
                                        }

                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text("Loading");
                                        }
                                        snapshot.data!.docs.forEach((element) {
                                          contract = Flash_Card(
                                              name: element["name"],
                                              spell: element["spell"],
                                              translation: element["translation"],
                                              example: element["example"],
                                              image: element["image"]);
                                          newListContract.add(contract!);
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
                                                                    newListContract,
                                                              )));
                                            },
                                            child: _buildCardTopic(
                                                image: e.image, name: e.name));
                                      }),
                            )
                            .toList()
                        )),
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
              _buildTopicNegotiation()
            ],
          )
          
          )
           
          
        );
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
        onTap: () {},
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
