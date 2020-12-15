import 'package:flutter/material.dart';
import 'package:MapKhuRo/googlemap_page/googlemap.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapKhuRo'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to the googlemap page'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => GoogleMap()));
            }),
      ),
    );
  }
}
