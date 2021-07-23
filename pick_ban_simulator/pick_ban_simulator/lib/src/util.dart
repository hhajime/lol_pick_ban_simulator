import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget banContainer(List banList, int n) {
  return Container(
    width: displayWidth * 0.0853,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: DragTarget<String>(
      onWillAccept: (value) {
        return true;
      },
      onAccept: (value) {
        banList[n] = value;
      },
      builder: (_, candidateData, rejectedData) {
        return Stack(children: [
          Container(
            width: 35.1,
            height: 48,
            alignment: Alignment.center,
            child: banList[n] != null
                ? Image.asset(
                    banList[n],
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Container(
            child: LongPressDraggable(
              data: banList[n],
              feedback: feedbackContainer(banList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {},
              onDragCompleted: () {},
              onDragEnd: (data) {},
              onDragStarted: () {
                temp = champIcon;
                banTemp = banList[n];
                tempNum = n;
              },
              child: Container(
                  child: Image.asset(banList[n], //3)
                      fit: BoxFit.cover,
                      height: displayRatio * 30,
                      width: 105.7)),
            ),
          ),
        ]);
      },
    ),
  );
}

Widget playerContainer(List playerList, int n) {
  return Container(
    width: displayWidth * 0.257,
    height: displayHeight * 0.0641,
    child: DragTarget<String>(onWillAccept: (value) {
      return true;
    }, onAccept: (value) {
      playerList[n] = value;
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          Container(
              width: displayRatio * 40,
              height: displayRatio * 60,
              alignment: Alignment.center,
              child: playerList[n] != null //1)
                  ? Image.asset(playerList[n], fit: BoxFit.cover)
                  : Container()),
          Container(
            child: LongPressDraggable(
              data: playerList[n],
              feedback: feedbackContainer(playerList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {},
              onDragCompleted: () {},
              onDragEnd: (data) {},
              onDragStarted: () {
                temp = playerList[n];
              },
              child: Container(
                  child: Image.asset(playerList[n], //3)
                      fit: BoxFit.cover,
                      height: displayRatio * 30,
                      width: 105.7)),
            ),
          ),
          IgnorePointer(
              child: Container(
                  child: Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset(
                          'assets/images/player_background.svg', //3)
                          fit: BoxFit.fitWidth,
                          height: displayRatio * 30,
                          width: 105.7)))),
          Positioned(
              right: 0, bottom: displayRatio * 2, child: playerName("PLAYER")),
          Positioned(
            right: 5,
            bottom: 15,
            child: Container(
              height: 15,
              width: 15,
              child: SvgPicture.asset(lines[n]),
            ),
          ),
        ],
      );
    }),
    decoration: myBoxDecoration(),
  );
}

Widget championGrid(List _image) {
  return Container(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: displayHeight / 1000,
        ),
        itemCount: _image.length,
        itemBuilder: (context, index) => GridTile(
            child: LongPressDraggable(
                data: _image[index],
                feedback: feedbackContainer(_image[index]),
                childWhenDragging: ChampContainer2(),
                onDragCompleted: () {},
                onDragEnd: (data) {},
                onDragStarted: () {
                  temp = _image[index];
                },
                onDragUpdate: (data) {},
                child: gridContainer(_image, index)),
            footer: Container(
              child: GridTileBar(
                backgroundColor: mainColor,
                subtitle: Text(
                  '$champName',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 8, color: subColor),
                ),
              ),
              height: 16,
              decoration: myBoxDecoration(),
            ))),
    decoration: myBoxDecoration(),
  );
}

TextStyle teamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 9,
      color: selectedColor);
}

TextStyle nameTextField() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 4,
      color: subColor);
}

Widget gridContainer(gridList, index) {
  champName = gridList[index].substring(47).replaceAll('.jpg', '');
  return Container(
      child: Image.asset(gridList[index],
          fit: BoxFit.cover, height: height, width: width),
      decoration: myBoxDecoration());
}

Widget teamName(Color selectColors, String hintText) {
  return Container(
    width: displayWidth * 0.427,
    height: displayHeight * 0.05,
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
    child: Text(
      text,
      textAlign: TextAlign.right,
      style: nameTextField(),
    ),
  );
}

Widget feedbackContainer(dynamic com) {
  return Container(
      width: 80,
      height: 90,
      decoration: new BoxDecoration(
        color: mainColor,
        border: Border.all(color: subColor, width: 3),
        image: DecorationImage(image: AssetImage(com), fit: BoxFit.cover),
      ));
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: mainColor,
    border: Border.all(color: subColor),
  );
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: subColor));
}

// ignore: non_constant_identifier_names
Widget ChampContainer2() {
  return Container(
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
              image: new AssetImage(champIcon), fit: BoxFit.scaleDown)));
}
