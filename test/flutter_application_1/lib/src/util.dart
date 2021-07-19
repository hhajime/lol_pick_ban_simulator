import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

ScrollController _scrollController;
Color caughtColor = Colors.red;
String _targetImage;
int variableSet = 0;
double width;
double height;

Container ChampionGrid(List _image) {
  return Container(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 4 / 4.5,
        ),
        itemCount: _image.length,
        itemBuilder: (context, index) => GridTile(
              child: LongPressDraggable(
                data: Image.asset(_image[index]),
                feedback: Container(
                  child: Image.asset(_image[index],
                      fit: BoxFit.cover, height: 100, width: 80),
                  decoration: myBoxDecoration(),
                ),
                child: Container(
                    child: Image.asset(_image[index],
                        fit: BoxFit.cover, height: height, width: width),
                    decoration: myBoxDecoration()),
              ),
            )),
    decoration: myBoxDecoration(),
  );
}

// ignore: non_constant_identifier_names
Container BanContainer() {
  return Container(
      child: DragTarget<String>(
        onAccept: (value) {
          print("check");
          _targetImage = value;
        },
        builder: (_, candidateData, rejectedData) {
          print("builder");
          print(_targetImage);
          return Container(
            width: 35.1,
            height: 45,
            color: Colors.red,
            alignment: Alignment.center,
            child: _targetImage != null
                ? Image.asset(
                    _targetImage,
                    fit: BoxFit.cover,
                  )
                : Container(),
          );
        },
      ),
      width: 35.1,
      height: 45,
      alignment: Alignment.center,
      decoration: myBoxDecoration());
}

Container BanContainer2() {
  return Container(
      width: 35.1,
      height: 45,
      alignment: Alignment.center,
      child: Image.asset(_targetImage, fit: BoxFit.cover),
      decoration: myBoxDecoration());
}

Container BanContainer3() {
  return Container(
    width: 35.1,
    height: 45,
    alignment: Alignment.center,
    color: Colors.green,
  );
}

Container BanContainer4() {
  return Container(
      width: 35.1,
      height: 45,
      alignment: Alignment.center,
      color: Colors.red,
      child: _targetImage != null
          ? Image.asset(
              _targetImage,
              fit: BoxFit.cover,
            )
          : Container());
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: MainColor,
    border: Border.all(color: SubColor),
  );
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: SubColor));
}

// ignore: non_constant_identifier_names
Container PlayerContainer() {
  return Container(
    height: 65,
    width: 105.5,
    decoration: myBoxDecoration(),
  );
}

// ignore: non_constant_identifier_names
TextStyle RedTeam() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 25,
      color: Colors.red);
}

// ignore: non_constant_identifier_names
TextStyle BlueTeam() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 25,
      color: Colors.blue);
}
