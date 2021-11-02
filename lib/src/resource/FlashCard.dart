import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashcard/icons/app_icon.dart';
import 'package:flashcard/src/resource/HomePage.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/src/model/FlashCard_model.dart';

class FlashCard extends StatefulWidget {
  // const FlashCard({Key? key}) : super(key: key);

  @override
  _FlashCard createState() => _FlashCard();
}

Flash_Card? wordData;

class _FlashCard extends State<FlashCard> {
  _renderCard(context) {
    return PageView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 20.0, bottom: 5.0),
                      // color: Colors.blue,
                      child: FlipCard(
                        direction: FlipDirection.HORIZONTAL,
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
                              Container(
                                height: 30,
                                width: 30,
                                // alignment: Alignment.centerRight,
                                margin: EdgeInsets.fromLTRB(300, 20, 0, 40),
                                child: Image.asset(
                                  "assets/images/heart.png",
                                ),
                              ),

                              // ảnh
                              Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "assets/images/economics.png")))),
                              Text(
                                "Economic",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Flashcard with the economic!",
                                style: TextStyle(fontSize: 12),
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
                                "ˌekəˈnämik",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Thuộc về kinh tế",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              });
  }

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
              child: _renderCard(context),
            )
          ],
        ),
      ),
    );
  }
}
