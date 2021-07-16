import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';

DragAndDropGridView ChampionGrid(List _image) {
  ScrollController _scrollController;
  int variableSet = 0;
  double width;
  double height;
  return DragAndDropGridView(
    controller: _scrollController,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 5,
      childAspectRatio: 4 / 4.5,
    ),
    padding: EdgeInsets.all(10),
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
              child: Image.asset(
            _image[index],
            fit: BoxFit.cover,
            height: height,
            width: width,
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
