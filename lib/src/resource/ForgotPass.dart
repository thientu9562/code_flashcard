import 'package:flashcard/src/resource/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPage createState() => _ForgotPage();
}

class _ForgotPage extends State<ForgotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.fromLTRB(30, 0, 30, 0), // cách viền trái, phải 1 khoảng
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset("assets/images/logo.png")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "EMAIL",
                    labelStyle:
                        TextStyle(fontSize: 12, color: Color(0xff888888))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextField(
                obscureText: true,
                style: TextStyle(fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Nhập mã",
                    labelStyle:
                        TextStyle(fontSize: 12, color: Color(0xff888888))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: onSummit,
                    child: Text(
                      "Summit",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSummit() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
