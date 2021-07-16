import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOL PICK & BAN SIMULATOR',
      home: Home(),
    );
  }
}
