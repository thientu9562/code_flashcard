import 'package:flashcard/src/resource/Wait.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'Login.dart';

class ForgotPage extends StatefulWidget{
  @override
  _ForgotPage createState () => _ForgotPage();
}
class _ForgotPage extends State<ForgotPage>{
  bool _isObscure = true; //hide password
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
                  child: Image.asset("assets/images/lock.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Column(
                  children: [
                    Text("FORGOT PASSWORD",
                      style: TextStyle (
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ) ,
                    ),
                  ],
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Identity verification'),
                        content: const Text('A confirmation code has been sent to the above email, please check and verify as requested.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                            child: const Text('OK'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => WaitPage()));
                            },
                            child: const Text('Resend code'),
                          ),
                        ],
                      ),
                    ),
                    child: Text("Summit", style: TextStyle(fontSize: 15, color: Colors.white),),
                  ),
                ],
              ),
            ),


          ],

        ),
    ));
  }
  void onSummit (){

  }
}