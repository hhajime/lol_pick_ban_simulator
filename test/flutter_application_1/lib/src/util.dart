import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

ScrollController _scrollController;
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
        return false;
      }
      return true;
    },
    onReorder: (oldIndex, newIndex) {
      final temp = _image[oldIndex];
      _image[oldIndex] = _image[newIndex];
      _image[newIndex] = temp;
    },
  );
}

// ignore: non_constant_identifier_names
Container BanContainer() {
  ScrollController _scrollController;
  int variableSet = 0;
  return Container(
    child: DragAndDropGridView(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 4 / 4.5,
      ),
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) => Card(
        elevation: 2,
        child: LayoutBuilder(
          builder: (context, costrains) {
            if (variableSet == 0) {
              height = 45;
              width = 35.1;
              variableSet++;
            }
            return GridTile(
                child: Container(
              decoration: myBoxDecoration(),
            ));
          },
        ),
      ),
      itemCount: 5,
      onWillAccept: (oldIndex, newIndex) {
        return true;
      },
      onReorder: (oldIndex, newIndex) {},
    ),
    height: 42,
    width: 175.5,
    decoration: myBoxDecoration(),
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
