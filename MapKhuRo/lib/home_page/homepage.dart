import 'package:flutter/material.dart';
import 'package:MapKhuRo/googlemap_page/googlemaps.dart';
import 'package:MapKhuRo/personal_page/friendslist.dart';

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
      body: Center(
        child: RaisedButton(
            child: Text('Go to the googlemap page'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => GoogleMaps()));
            }),
      ),
    );
  }
}
