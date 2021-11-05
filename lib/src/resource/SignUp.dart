
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_Page createState () => _SignUp_Page();
}

class _SignUp_Page extends State<SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0), // cách viền trái, phải 1 khoảng
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
                  decoration: BoxDecoration (
                    shape: BoxShape.circle
                  ),
                  child: Image.asset("assets/images/logo.png")
              ),
            ), 
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Column(
                  children: [
                    Text("Welcome Flashcard!",
                      style: TextStyle (
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                    Text("Signup with Flashcard in simple steps",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff888888)
                      ),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(
                style: TextStyle (fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "USERNAME",
                  labelStyle: TextStyle( fontSize: 12, color: Color(0xff888888))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(
                style: TextStyle (fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "EMAIL",
                    labelStyle: TextStyle( fontSize: 12, color: Color(0xff888888))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(
                obscureText: true,
                style: TextStyle (fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "PASSWORD",
                    labelStyle: TextStyle( fontSize: 12, color: Color(0xff888888))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: TextField(
                obscureText: true,
                style: TextStyle (fontSize: 20, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Re-enter PASSWORD",
                    labelStyle: TextStyle( fontSize: 12, color: Color(0xff888888))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: RaisedButton(
                color: Colors.blue,
                  onPressed: (){
                    showAlertDialog(context);
                  },
                child: Text("SIGN UP", style: TextStyle(fontSize: 15, color: Colors.white),),
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a user?", style: TextStyle(fontSize: 15, color: Color(0xff888888)),),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        },
                        child: Text("Login now", style: TextStyle(fontSize: 15, color: Colors.blue),)
                    )
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

// thông báo đăng ký thành công
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    color: Colors.blue,
    child: Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Chúc mừng bạn đã đăng ký thành công!", style: TextStyle(fontSize: 20, color: Colors.blue),),
    content: Text("Nhấn OK để đăng nhập."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}