// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flashcard/src/model/FlashCard_model.dart';
// import 'package:flashcard/src/resource/FlashCard.dart';
// import 'package:flutter/material.dart';
// import 'dart:developer';

// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);

//   @override
//   _MyHomePage createState() => _MyHomePage();
// }

// class _MyHomePage extends State<test> {
//   var economicData;
//   var contractData;
//   var negotiationData;
//   var marketingData;
//   var commerceData;
//   var businessData;
//   List<Flash_Card> newList = [];
//   Flash_Card? word;

//   final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _key,
//         drawer: Drawer(
//           child: _builDrawer(),
//         ),
//         appBar: AppBar(
//           title: Text("Learn English with Flashcards"),
//           leading: InkWell(
//             onTap: () {
//               _key.currentState!.openDrawer();
//             },
//             child: Icon(
//               Icons.menu,
//               size: 27,
//             ),
//           ),
//         ),
//         body: Container(
//           child: StreamBuilder<QuerySnapshot>(
//             stream:
//                 FirebaseFirestore.instance.collection('category').snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Text("Loading");
//               }
//               snapshot.data!.docs.forEach((element) {
//                 word =
//                     Flash_Card(name: element["name"], image: element['image']);
//                 newList.add(word!);
//               });
              
//               return StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('category')
//                 .doc('7T11BTgTbgSBx11fubMO')
//                 .collection("flashcard")
//                 .snapshots(),
//                 builder: (context, snapshot) {
//                   return new ListView(
//                     children: newList.map((e) => 
//                       Column(
//                         children: [
//                           Text(e.name)
//                         ],
//                       )
//                     ).toList(),
//                     // children: snapshot.data!.docs.map((DocumentSnapshot document) {
//                     //   return Column(
//                     //     children: [
//                     //       new Container(
//                     //         child: Image.network(document["image"]),
//                     //       ),
//                     //       Text(document["name"])
//                     //     ],
//                     //   );
//                     // }).toList(),
//                   );
//                 }
//               );
//             },
//           ),
//         ));
//   }

//   Widget _builDrawer() {
//     return ListView(children: [
//       UserAccountsDrawerHeader(
//           currentAccountPicture: CircleAvatar(
//             backgroundImage: AssetImage("assets/images/userImage.png"),
//           ),
//           accountName: Text(
//             "Thiên Tú",
//             style: TextStyle(fontSize: 15, color: Colors.black),
//           ),
//           accountEmail: Text("thientu9562@gmail.com",
//               style: TextStyle(fontSize: 12, color: Colors.black))),
//       ListTile(
//         selected: true,
//         onTap: () {},
//         leading: Icon(Icons.home),
//         title: Text("Home"),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.task),
//         title: Text("NoteBook"),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.info),
//         title: Text("About"),
//       ),
//       ListTile(
//         onTap: () {},
//         leading: Icon(Icons.exit_to_app),
//         title: Text("Log out"),
//       )
//     ]);
//   }
// }
