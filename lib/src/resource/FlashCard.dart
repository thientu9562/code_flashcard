import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcard/icons/app_icon.dart';
import 'package:flashcard/src/model/FlashCard_model.dart';
import 'package:flashcard/src/model/FlashCard_model.dart';
import 'package:flashcard/src/resource/HomePage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// class FlashCard extends StatefulWidget {
//   // const FlashCard({Key? key}) : super(key: key);
//   final String name;
//   List<Flash_Card> snapshot;
//   FlashCard({
//     required this.name,
//     required this.snapshot,
//   });
//   @override
//   _FlashCard createState() => _FlashCard( this.name, this.snapshot);
// }

class FlashCard extends StatelessWidget {
  final String name;
  List<Flash_Card> snapshot;
  FlashCard({
    required this.name,
    required this.snapshot,
  });
  bool _isLike = false;

  // _renderCard(context) {
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn English with Flashcards"),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          child: Icon(
            Icons.assignment_return,
            size: 27,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(20),
                height: size.height * 1 / 10,
                child: Text(
                  "'Genius is 1% talent and 99% percent hard work' - Albert Einstein",
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                height: size.height * 2 / 3,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot
                        .map(
                          (e) =>
                              // thẻ card để tạ khoảng cách giữa các flipcard
                              Card(
                            // elevation: 0.0,
                            margin: EdgeInsets.only(
                                left: 30.0,
                                right: 30.0,
                                top: 20.0,
                                bottom: 5.0),
                            // color: Colors.blue,
                            child: FlipCard(
                              direction: FlipDirection.HORIZONTAL, // lật ngang
                              speed: 1000,
                              onFlipDone: (status) {
                                print(status);
                              },
                              front: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6)
                                    ],
                                    color: Color(0xFFa1bcff),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          alignment: Alignment.centerRight,
                                          // margin: EdgeInsets.fromLTRB(200, 20, 0, 0),
                                          child: IconButton(
                                              onPressed: () {
                                                onLike();
                                              },
                                              icon: Icon(
                                                  Icons.add_reaction_outlined,
                                                  color: _isLike
                                                      ? Colors.red
                                                      : Colors.white))
                                          // Image.asset(
                                          //   "assets/images/heart.png",
                                          // ),
                                          ),
                                    ),

                                    // ảnh
                                    Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(e.image)))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.example,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              back: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(3, 6),
                                          blurRadius: 6)
                                    ],
                                    color: Color(0xFFa1bcff),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.spell,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      e.translation,
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()))
          ],
        ),
      ),
    );
  }

  void onLike() {
    setState() {
      _isLike = !_isLike;
    }
  }
}
