import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcard/src/resource/FlashCard.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  var economicData;
  var contractData;
  var negotiationData;
  var marketingData;
  var commerceData;
  var businessData;

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
        body: Container(
            // future: FirebaseFirestore.instance
            //     .collection("categories")
            //     .doc("bnZBd1fEXfGf4WzQxf3G")
            //     .get(),
            // builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }
               child: ListView(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          //card 1 economic
                          FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection("categories")
                                  .doc("bnZBd1fEXfGf4WzQxf3G")
                                  .collection("economic")
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                economicData = snapshot;
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => FlashCard(
                                                  
                                                )));
                                  },
                                  child: Card(
                                    color: Color(0xffe5ebe7),
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blue, width: 2),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 30, 0),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              //tạo viền cho hình
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              //làm ảnh thành hình tròn
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.asset(
                                                    "assets/images/economics.png",
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                          Text(
                                            "Economic",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          //card 2
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => FlashCard(
                                           
                                          )));
                            },
                            child: Card(
                              color: Color(0xffe5ebe7),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 30, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        //tạo viền cho hình
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        //làm ảnh thành hình tròn
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/marketing.png",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      "Marketing",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card 3
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => FlashCard(
                                           
                                          )));
                            },
                            child: Card(
                              color: Color(0xffe5ebe7),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 30, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        //tạo viền cho hình
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        //làm ảnh thành hình tròn
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/contract.png",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      "Contract",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card 4
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => FlashCard(
                                          
                                          )));
                            },
                            child: Card(
                              color: Color(0xffe5ebe7),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 30, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        //tạo viền cho hình
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        //làm ảnh thành hình tròn
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/negotiations.png",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      "Negotiation",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card 5
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => FlashCard(
                                            
                                          )));
                            },
                            child: Card(
                              color: Color(0xffe5ebe7),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 30, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        //tạo viền cho hình
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        //làm ảnh thành hình tròn
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/business_planning.png",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      "Business Planning",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //card 6
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => FlashCard(
                                           
                                          )));
                            },
                            child: Card(
                              color: Color(0xffe5ebe7),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 30, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        //tạo viền cho hình
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        //làm ảnh thành hình tròn
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.asset(
                                              "assets/images/contract.png",
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      "Commerce",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
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
