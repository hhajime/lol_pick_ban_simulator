import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/Home/home.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  TestState createState() => TestState();
}

class TestState extends State<MyApp> {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOL Pick Ban Simulator',
      home: Home(),
    );
  }
}
