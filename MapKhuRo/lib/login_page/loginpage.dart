import 'package:flutter/material.dart';
import 'package:MapKhuRo/home_page/homepage.dart';
import 'package:MapKhuRo/signup_page/singup.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user.txt');
  }

  Future<File> writeUser(String email) async {
    final file = await _localFile;

    return file.writeAsString('$email');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      String contents = await file.readAsString();
      // Error가 없을 경우 contents를 반환.
      return contents;
    } catch (e) {
      // 에러가 발생할 경우 e을 반환.
      return e.toString();
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController studentNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget buildMainLogo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 100.0,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget buildStudentId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('학번입력'),
        SizedBox(height: 10.0),
        Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: studentNumber,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "학번을 입력하세요",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('비밀번호'),
        SizedBox(height: 10.0),
        Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "비밀번호를 입력하세요",
              border: InputBorder.none,
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          print("Success");
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.red[300],
        child: Text(
          '로그인',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SignUpPage()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.red[300],
        child: Text(
          '회원가입',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
          backgroundColor: Colors.redAccent[200],
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              buildMainLogo(),
              SizedBox(height: 2.0),
              buildStudentId(),
              SizedBox(height: 10.0),
              buildPassword(),
              SizedBox(height: 35.0),
              buildLoginBtn(),
              SizedBox(height: 5.0),
              buildSignUpBtn(),
            ],
          ),
        ));
  }
}
