import 'package:flashcard/screens/demo.dart';
import 'package:flashcard/src/resource/FlashCard.dart';
import 'package:flashcard/src/resource/HomePage.dart';
import 'package:flashcard/src/resource/Login.dart';
import 'package:flashcard/src/resource/test.dart';
import 'package:flashcard/src/resource/welcom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // home: JsonParseDemo(),
      home: MyHomePage(),
    );
  }
}
