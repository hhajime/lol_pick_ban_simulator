import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';

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

BoxDecoration myTextBoxDecoration(double width, double radius) {
  return BoxDecoration(
      color: mainColor,
      border: Border.all(color: subColor, width: width),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

TextStyle teamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 7,
      color: selectedColor);
}

Widget basicDrawer() {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: mainColor)),
      ListTile(
        leading: Icon(
          Icons.delete_forever_outlined,
          size: displayRatio * 20,
          color: mainColor,
        ),
        title: Text(
          'Delete All',
        ),
        trailing: Icon(
          Icons.drag_handle,
          size: displayRatio * 20,
          color: mainColor,
        ),
        dense: true,
        onTap: () {},
      ),
    ],
  ));
}

Widget leagueContainer(String league) {
  return Container(
    decoration: myTextBoxDecoration(displayRatio * 2, 30),
    margin: EdgeInsets.fromLTRB(displayWidth * 0.1, displayHeight * 0.02,
        displayWidth * 0.1, displayHeight * 0.01),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: mainColor,
          onPrimary: subColor,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          )),
      child: Row(children: [
        Container(
          width: displayWidth * 0.2,
          height: displayHeight * 0.13,
          child: SvgPicture.asset(
            'assets/images/SVG/${league}.svg',
            color: subColor,
            fit: BoxFit.contain,
          ),
        )
      ]),
      onPressed: () {
        debugPrint("click");
        Get.put(UpdateController());
      },
    ),
  );
}

Widget countryTextContainer(String country) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
        displayWidth * 0.04, 0, displayWidth * 0.05, displayHeight * 0.01),
    child: Text(
      country,
      style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
    ),
  );
}
