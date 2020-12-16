import 'package:MapKhuRo/personal_page/myinformation.dart';
import 'package:flutter/material.dart';
import 'package:MapKhuRo/googlemap_page/googlemaps.dart';
import 'package:MapKhuRo/personal_page/friendslist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MapKHURo'),
          backgroundColor: Colors.redAccent[200],
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10.0),
            Center(
              child: Container(
                width: 320.0,
                height: 150.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyInfomation()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[300],
                  child: Text(
                    '내정보',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 320.0,
                height: 150.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => FriendList()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[400],
                  child: Text(
                    '친구목록 불러오기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 320.0,
                height: 150.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => GoogleMaps()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[500],
                  child: Text(
                    'Map -> KHU RO!\n 경희대학교로 출발!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 220.0,
                child: RaisedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: Colors.red[700],
                  child: Text(
                    '로그아웃',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ));
  }
}
