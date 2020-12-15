import 'package:flutter/material.dart';
import 'login_page/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(primaryColor: Colors.amber, accentColor: Colors.black),
      title: "MapKhuRo",
      home: LoginPage(),
    );
  }
}
