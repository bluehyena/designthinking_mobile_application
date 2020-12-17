import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
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
  @override
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
            Text('1교시'),
            Icon(
              Icons.book,
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
                    snapshot.data.documents[1]['class1'],
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
            Text('2교시'),
            Icon(Icons.book),
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
                    snapshot.data.documents[1]['class2'],
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
            Text('3교시'),
            Icon(Icons.book),
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
                    snapshot.data.documents[1]['class3'],
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
            Text('4교시'),
            Icon(Icons.book),
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
                    snapshot.data.documents[1]['class4'],
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
            Text('5교시'),
            Icon(Icons.book),
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
                    snapshot.data.documents[1]['class5'],
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

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('시간표'),
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
              SizedBox(height: 55.0),
              buildLoadData(),
              SizedBox(height: 35.0),
            ],
          ),
        ));
  }
}
