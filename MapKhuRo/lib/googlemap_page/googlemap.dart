import 'package:flutter/material.dart';

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapKhuRo'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Go to the googlemap page'), onPressed: () {}),
      ),
    );
  }
}
