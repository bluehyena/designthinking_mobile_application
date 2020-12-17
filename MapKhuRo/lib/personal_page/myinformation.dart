import 'package:MapKhuRo/personal_page/revisemyinfo.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInformation extends StatefulWidget {
  @override
  _MyInformationState createState() => _MyInformationState();
}

class _MyInformationState extends State<MyInformation> {
  String emailid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SharedPreferences _prefEmail;

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  void _loadEmail() async {
    _prefEmail = await SharedPreferences.getInstance();
    setState(() {
      emailid = (_prefEmail.getString('emailid') ?? 'abc123@khu.ac.kr');
    });
  }

  void loadUserData(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('UserID').doc(id).get();
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

  Widget buildChangeBtn() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ReviseMyInformation()));
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
      stream: Firestore.instance.collection(emailid).snapshots(),
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
              SizedBox(height: 25.0),
              buildLoadData(),
              SizedBox(height: 35.0),
              buildChangeBtn(),
            ],
          ),
        ));
  }
}
