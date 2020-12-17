import 'package:MapKhuRo/login_page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<File> writeUser(String userid) async {
    final file = await _localFile;

    // 파일 쓰기
    return file.writeAsString('$userid');
  }

  Future<String> readUser() async {
    try {
      final file = await _localFile;

      // 파일 읽기.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // 에러가 발생할 경우 e를 반환.
      return e;
    }
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print('회원가입 에러 : $e');
    } catch (e) {
      print('회원가입 에러 : $e');
    }
  }

  void CreateUser(String id, String password, String name, String phone,
      String studentnumber) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection(id).doc('Profile').set({
      'Id': id,
      'Password': password,
      'Name': name,
      'Phone': phone,
      'StudentNumber': studentnumber
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  String _email;
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
          height: 60.0,
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

  Widget buildSignUpBtn() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          _createUser();
          CreateUser(
              emailController.text,
              passwordController.text,
              nameController.text,
              phoneController.text,
              studentNumberController.text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.red[300],
        child: Text(
          '가입완료',
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
          title: Text('회원가입'),
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
              SizedBox(height: 10.0),
              buildName(),
              SizedBox(height: 7.0),
              buildStudentNumber(),
              SizedBox(height: 7.0),
              buildPhone(),
              SizedBox(height: 7.0),
              buildEmail(),
              SizedBox(height: 7.0),
              buildPassword(),
              SizedBox(height: 25.0),
              buildSignUpBtn(),
            ],
          ),
        ));
  }
}
