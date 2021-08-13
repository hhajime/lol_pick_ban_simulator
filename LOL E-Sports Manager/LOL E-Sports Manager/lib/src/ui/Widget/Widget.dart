import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
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

BoxDecoration myTextBoxDecoration(double width, Color colors, double radius) {
  return BoxDecoration(
      color: colors,
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

Widget gridContainer(con) {
  if (con != champIcon) {
    champName = con.substring(47).replaceAll('.jpg', '');
  }
  return Stack(children: [
    greyOutChampContainer(con),
    Container(
        width: displayWidth * 0.2,
        height: displayHeight * 0.1,
        child: Image.asset(con, fit: BoxFit.cover),
        decoration: myBoxDecoration())
  ]);
}

Widget teamName(Color selectColors, String hintText) {
  return Container(
    width: displayWidth * 0.427,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          hintStyle: teamColor(selectColors),
          hintText: hintText,
          contentPadding: EdgeInsets.all(7)),
      style: teamColor(selectColors),
    ),
  );
}

Widget playerName(String text) {
  return Container(
    height: 11,
    width: displayRatio * 40,
    child: TextField(
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: text,
        hintStyle: nameTextField(),
      ),
      textAlign: TextAlign.right,
      style: nameTextField(),
    ),
  );
}

Widget feedbackContainer(dynamic com) {
  return Container(
      width: displayWidth * 0.2,
      height: displayHeight * 0.12,
      decoration: new BoxDecoration(
        color: mainColor,
        border: Border.all(color: subColor, width: 3),
        image: DecorationImage(image: AssetImage(com), fit: BoxFit.cover),
      ));
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: subColor), color: mainColor);
}

// ignore: non_constant_identifier_names
Widget ChampContainer2() {
  return Container(
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champIcon),
            fit: BoxFit.scaleDown,
          )));
}

Widget greyOutChampContainer(dynamic champ) {
  return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.grey,
        backgroundBlendMode: BlendMode.saturation,
      ),
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champ),
            fit: BoxFit.cover,
          )));
}

DecorationImage imageMaker(dynamic champ) {
  return DecorationImage(image: new AssetImage(champ), fit: BoxFit.cover);
}

Widget countryTextContainer(String country) {
  if (country == 'lck') {
    country = "한국";
  } else if (country == 'lpl') {
    country = '중국';
  } else if (country == 'lec') {
    country = '유럽';
  } else if (country == 'lcs') {
    country = '북미';
  } else if (country == 'ljl') {
    country = '일본';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'cblol') {
    country = '브라질';
  } else if (country == 'lco') {
    country = '오세아니아';
  } else if (country == 'lla') {
    country = '라틴아메리카';
  } else if (country == 'lcl') {
    country = '독립국가연합';
  }

  return Container(
    alignment: Alignment.bottomCenter,
    margin: EdgeInsets.fromLTRB(
        displayWidth * 0.04, 0, displayWidth * 0.05, displayHeight * 0.005),
    child: Text(
      country,
      style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
    ),
  );
}

Widget nameTextFieldForm(int _maxlength) {
  return Container(
    height: displayHeight * 0.04,
    margin: EdgeInsets.fromLTRB(displayWidth * 0.1, displayHeight * 0.025,
        displayWidth * 0.1, displayHeight * 0.015),
    child: Container(
        margin: EdgeInsets.fromLTRB(
            displayWidth * 0.04, 0, displayWidth * 0.04, displayHeight * 0.005),
        child: TextFormField(
          style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
          maxLines: 1,
          maxLength: _maxlength,
          decoration: InputDecoration(
              counterStyle: TextStyle(color: subColor),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white, width: displayHeight * 0.002),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: subColor, width: displayHeight * 0.002),
              )),
          textAlignVertical: TextAlignVertical.center,
        )),
  );
}

Widget nameText(String _hint, double margin) {
  return Container(
    margin: EdgeInsets.only(right: displayWidth * margin),
    child: Text(
      _hint,
      style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
    ),
  );
}

Widget genderButton(String gender) {
  Color tempConlor;
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        primary: mainColor,
        onPrimary: subColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: subColor),
          borderRadius: new BorderRadius.circular(30.0),
        )),
    onPressed: () {
      debugPrint('hello');
    },
    child: Text(gender),
  );
}

Widget traitButton(String trait) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shadowColor: Colors.black,
        primary: mainColor,
        onPrimary: subColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: subColor),
          borderRadius: new BorderRadius.circular(30.0),
        )),
    onPressed: () {
      debugPrint('hello');
    },
    child: Text(trait),
  );
}

Widget Rot() {
  return RotatedBox(
    quarterTurns: 1,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      height: displayHeight * 0.154,
      decoration: BoxDecoration(
          border: Border.all(color: subColor, width: displayHeight * 0.003)),
      child: Column(
        children: [
          Container(
            decoration: myBoxDecoration(),
            child: Text(
              '2021/1/10 10:30PM',
              style: TextStyle(color: subColor),
            ),
          ),
          Row(
            children: [
              Container(
                  height: displayHeight * 0.1,
                  width: displayWidth * 0.16,
                  child: Image.asset(leagues.league_lck[9])),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.04, 0, displayWidth * 0.04, 0),
                  child: Text(
                    'VS',
                    style: titleLogo(10, subColor, FontStyle.normal),
                  )),
              Container(
                  height: displayHeight * 0.1,
                  width: displayWidth * 0.16,
                  child: Image.asset(leagues.league_lck[2])),
            ],
          ),
        ],
      ),
    ),
  );
}
