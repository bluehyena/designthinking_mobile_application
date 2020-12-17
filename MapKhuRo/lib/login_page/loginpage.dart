import 'package:flutter/material.dart';
import 'package:MapKhuRo/home_page/homepage.dart';
import 'package:MapKhuRo/signup_page/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailid = '';
  String _password = '';
  SharedPreferences _prefEmail;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  void _loadEmail() async {
    _prefEmail = await SharedPreferences.getInstance();
    setState(() {
      emailid = (_prefEmail.getString(emailid) ?? 'abc123@khu.ac.kr');
    });
  }

  Future<String> _getStringFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupEmail = prefs.getString('startupEmail');
    if (startupEmail == null) {
      return '';
    }
    return startupEmail;
  }

  Future<void> _resetPref() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('startupEmail', '');
  }

  Future<void> _incrementEmail() async {
    final prefs = await SharedPreferences.getInstance();

    String lastStartupEmail = await _getStringFromSharedPref();
    String currentStartupEmail = ''; //firebase data

    await prefs.setString('startupEmail', currentStartupEmail);
  }

  final emailController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailid,
        password: _password,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      print('에러 : $e');
    } catch (e) {
      print('에러 : $e');
    }
  }

  void CreateCurrentUser(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('UserID').doc('000000').set({
      'Id': id,
    });
  }

  Widget buildMainLogo() {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 100.0,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget buildEmailId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('KHU메일 입력'),
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
              emailid = value;
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "KHU메일을 입력하세요",
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
            onSubmitted: (value) {
              _password = value;
            },
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
          CreateCurrentUser(emailController.text);
          _login();
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
              SizedBox(height: 40.0),
              buildMainLogo(),
              SizedBox(height: 20.0),
              buildEmailId(),
              SizedBox(height: 15.0),
              buildPassword(),
              SizedBox(height: 40.0),
              buildLoginBtn(),
              SizedBox(height: 5.0),
              buildSignUpBtn(),
            ],
          ),
        ));
  }
}
