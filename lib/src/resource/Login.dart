import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ForgotPass.dart';
import 'HomePage.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userControler =
      new TextEditingController(); // điều khiển dữ liệu nhập vào
  TextEditingController _passControler = new TextEditingController();
  bool _userErr = false;
  bool _passErr = false;
  var _userMessErr = "Tài khoản không hợp lệ!";
  var _passMessErr = "Mật khẩu không hợp lệ!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //them Logo
          Padding(
            padding: const EdgeInsets.fromLTRB(
                0, 0, 0, 30), // tạo padđing cho logo với chữ
            child: Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //tạo viền cho logo
              ),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Login to continue using Flashcard",
                      style: TextStyle(fontSize: 15, color: Color(0xff888888)),
                    ),
                  ],
                ),
              )),
          //
          // them textfield username
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: TextField(
              style: TextStyle(fontSize: 20, color: Colors.black),
              controller: _userControler, // điều khiển dữ liệu nhập vào
              decoration: InputDecoration(
                  errorText: _userErr
                      ? _userMessErr
                      : null, // thông báo lỗi khi nhập sai
                  labelText: "USERNAME",
                  labelStyle:
                      TextStyle(color: Color(0xff888888), fontSize: 12)),
            ),
          ),
          // them textfield cho password
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Stack(
              // stack cho phép các field chồng lên nhau
              alignment: AlignmentDirectional
                  .centerEnd, //child icon nằm căn giữa và cuối của stack
              children: <Widget>[
                TextField(
                  obscureText: !_showPass, // thuộc tính pass được mã hóa
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  controller: _passControler, // điều khiển dữ liệu vào
                  decoration: InputDecoration(
                      errorText: _passErr
                          ? _passMessErr
                          : null, // thông báo lỗi khi sai
                      labelText: "PASSWORD",
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 12)),
                ),
                GestureDetector(
                    onTap: onShowPass,
                    child: Icon(
                      CupertinoIcons.eye,
                      size: 15,
                      color: Color(0xff888888),
                    ))
              ],
            ),
          ),
          // text quên mật khẩu
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPage()));
                    },
                    child: Text("Forgot password",
                        style: TextStyle(fontSize: 12, color: Colors.blue)))
              ],
            )),
          ),
          // thêm button
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: RaisedButton(
              color: Colors.blue,
              onPressed: () {
                onSignInClicked();
              },
              child: Text(
                "SIGN IN",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          // tạo text đăng ký
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            child: Container(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // căn đều giữa các item
                children: [
                  Text(
                    "New user?",
                    style: TextStyle(fontSize: 12, color: Color(0xff888888)),
                  ),
                  GestureDetector(
                      child: Text(
                        "Sign up for a new account",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp_Page()));
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  void onShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      // kiểm tra user name có trên 8 ký tự vào có chứa @ không
      if (_userControler.text.length < 8 ||
          !_userControler.text.contains("@")) {
        _userErr = true;
      } else {
        _userErr = false;
      }
      // kiểm tra pass
      if (_passControler.text.length < 8) {
        _passErr = true;
      } else {
        _passErr = false;
      }
      // chuyển đến trang chủ
      if (!_userErr && !_passErr) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    });
  }
}
