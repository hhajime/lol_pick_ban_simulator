import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: mainColor,
    border: Border.all(color: subColor),
  );
}

TextStyle nameTextField() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 4,
      color: subColor);
}

TextStyle titleLogo(multiple, color, style) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: style,
      fontSize: displayRatio * multiple,
      color: color);
}

Widget basicAppBar() {
  return AppBar(
      iconTheme: IconThemeData(color: subColor),
      toolbarHeight: displayHeight * 0.05,
      title: Text(
        "LOL E-Sports Manager",
        style: TextStyle(color: subColor),
      ),
      brightness: Brightness.dark,
      backgroundColor: mainColor);
}

BoxDecoration myTextBoxDecoration() {
  return BoxDecoration(
      color: mainColor,
      border: Border.all(color: subColor, width: 3),
      borderRadius: BorderRadius.all(Radius.circular(20)));
}
