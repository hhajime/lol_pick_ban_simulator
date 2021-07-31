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
        "LOL: E-Sports Manager",
        style: TextStyle(color: subColor, fontSize: displayRatio * 8),
      ),
      brightness: Brightness.dark,
      backgroundColor: mainColor);
}

BoxDecoration myTextBoxDecoration() {
  return BoxDecoration(
      color: mainColor,
      border: Border.all(color: subColor, width: displayWidth * 0.01),
      borderRadius: BorderRadius.all(Radius.circular(20)));
}

TextStyle teamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 7,
      color: selectedColor);
}
