import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

ScrollController _scrollController;
String _tempImage;
Container _tempContainer;
int variableSet = 0;
double width;
double height;

DragAndDropGridView ChampionGrid(List _image) {
  return DragAndDropGridView(
    controller: _scrollController,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      childAspectRatio: 4 / 4.5,
    ),
    padding: EdgeInsets.all(2),
    itemBuilder: (context, index) => Card(
      elevation: 2,
      child: LayoutBuilder(
        builder: (context, costrains) {
          if (variableSet == 0) {
            height = costrains.maxHeight;
            width = costrains.maxWidth;
            variableSet++;
          }
          return GridTile(
              child: Container(
            child: Image.asset(
              _image[index],
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
            decoration: myBoxDecoration(),
          ));
        },
      ),
    ),
    itemCount: _image.length,
    onWillAccept: (oldIndex, newIndex) {
      if (_image[newIndex] == "something") {
        print("onwillaccept");
        return false;
      }
      _tempImage = _image[oldIndex];
      return true;
    },
    onReorder: (oldIndex, newIndex) {
      print("onreorder+${DateTime.now()}");
      final temp = _image[oldIndex];
      _image[oldIndex] = _image[newIndex];
      _image[newIndex] = temp;
    },
  );
}

// ignore: non_constant_identifier_names
Container BanContainer() {
  return new Container(
      child: DragTarget(
        builder: (context, List<int> candidateData, rejectedData) {
          print("dragged");
          return BanContainer4();
        },
        onAccept: (data) {
          print("data recieved1");
          return BanContainer3();
        },
        onWillAccept: (data) {
          print("data recieved2");
          return true;
        },
        onMove: (data) {
          print("data recieved3");
          return BanContainer3();
        },
        onLeave: (data) {
          print("data recieved4");
          return BanContainer3();
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
      child: Image.asset(_tempImage, fit: BoxFit.cover),
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
  );
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
