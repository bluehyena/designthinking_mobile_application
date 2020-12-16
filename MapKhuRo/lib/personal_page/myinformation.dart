import 'package:MapKhuRo/login_page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:MapKhuRo/home_page/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInformation extends StatefulWidget {
  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  String _email = '0501kdh7@khu.ac.kr';
  SharedPreferences _prefEmail;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  void _loadEmail() async {
    _prefEmail = await SharedPreferences.getInstance();
    setState(() {
      _email = (_prefEmail.getString('_email') ?? '');
    });
  }

  String _password;
  String _phone;
  String _studentNumber;
  String _name;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final studentNumberController = TextEditingController();
  final nameController = TextEditingController();

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('KHU-Mail'),
        SizedBox(height: 10.0),
        Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: emailController,
            onSubmitted: (value) {
              _email = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.keyboard,
                color: Colors.white,
              ),
              hintText: "KHU-Mail 주소 입력 (ID로 사용)",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('전화번호'),
        SizedBox(height: 10.0),
        Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: phoneController,
            onSubmitted: (value) {
              _phone = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: "전화번호 입력 (- 제외)",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('이름'),
        SizedBox(height: 10.0),
        Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: nameController,
            onSubmitted: (value) {
              _name = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "이름을 입력하세요.",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStudentNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('학번'),
        SizedBox(height: 10.0),
        Container(
          height: 25.0,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(100.0)),
          child: TextField(
            controller: studentNumberController,
            onSubmitted: (value) {
              _studentNumber = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.tag,
                color: Colors.white,
              ),
              hintText: "학번을 입력하세요.",
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
            controller: passwordController,
            onSubmitted: (value) {
              _password = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "비밀번호를 입력하세요. (6자리 이상)",
              border: InputBorder.none,
            ),
            obscureText: true,
          ),
        ),
      ],
    );
  }

  Widget buildChangeBtn() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          print('_email');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.red[300],
        child: Text(
          '내정보 변경',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget buildLoadData() {
    return StreamBuilder(
      // ignore: deprecated_member_use
      stream: Firestore.instance.collection('UserID').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('데이터 로딩중.. 잠시만 기다려주세요...');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 1.0),
            Text('Email'),
            Icon(
              Icons.email,
              color: Colors.black,
            ),
            SizedBox(height: 5.0),
            Center(
              child: Container(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[200],
                  child: Text(
                    snapshot.data.documents[0]['Id'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text('이름'),
            Icon(Icons.person),
            Center(
              child: Container(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[200],
                  child: Text(
                    snapshot.data.documents[0]['Name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text('비밀번호'),
            Icon(Icons.lock),
            Center(
              child: Container(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[200],
                  child: Text(
                    snapshot.data.documents[0]['Password'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text('전화번호'),
            Icon(Icons.call),
            Center(
              child: Container(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[200],
                  child: Text(
                    snapshot.data.documents[0]['Phone'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text('학번'),
            Icon(Icons.credit_card),
            Center(
              child: Container(
                width: 320.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[200],
                  child: Text(
                    snapshot.data.documents[0]['StudentNumber'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('내정보 확인'),
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
              // Center(
              //   child: Container(
              //     width: 320.0,
              //     height: 70.0,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30.0),
              //       ),
              //       color: Colors.red[400],
              //       child: Text(
              //         '친구목록 불러오기',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18.0,
              //             fontWeight: FontWeight.bold,
              //             fontFamily: 'OpenSans'),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10.0),
              // Center(
              //   child: Container(
              //     width: 320.0,
              //     height: 150.0,
              //     child: RaisedButton(
              //       onPressed: () {},
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30.0),
              //       ),
              //       color: Colors.red[400],
              //       child: Text(
              //         '친구목록 불러오기',
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18.0,
              //             fontWeight: FontWeight.bold,
              //             fontFamily: 'OpenSans'),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 10.0),
              buildLoadData(),
              SizedBox(height: 15.0),
              buildChangeBtn(),
            ],
          ),
        ));
  }
}
