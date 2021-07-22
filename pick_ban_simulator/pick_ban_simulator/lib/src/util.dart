import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/home.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: non_constant_identifier_names
Container BanContainer(List BanList, int n) {
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
        BanList[n] = value;
      },
      builder: (_, candidateData, rejectedData) {
        return Stack(children: [
          Container(
            width: 35.1,
            height: 48,
            alignment: Alignment.center,
            child: BanList[n] != null
                ? Image.asset(
                    BanList[n],
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Container(
            child: LongPressDraggable(
              data: BanList[n],
              feedback: feedbackContainer(BanList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {
                print("onDragUpdated");
              },
              onDragCompleted: () {
                // 여기에 추가
                print("onDragCompleted_player");
              },
              onDragEnd: (data) {
                print("onDragEnd");
              },
              onDragStarted: () {
                print("onDragStarted");
                temp = 'assets/images/champion_icon.jpg';
              },
              child: Container(
                  child: Image.asset(BanList[n], //3)
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

// ignore: non_constant_identifier_names
Container PlayerContainer(List PlayerList, int n) {
  return Container(
    width: displayWidth * 0.257,
    height: displayHeight * 0.0641,
    child: DragTarget<String>(onWillAccept: (value) {
      return true;
    }, onAccept: (value) {
      PlayerList[n] = value;
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          Container(
              width: displayRatio * 40,
              height: displayRatio * 60,
              alignment: Alignment.center,
              child: PlayerList[n] != null //1)
                  ? Image.asset(PlayerList[n], fit: BoxFit.cover)
                  : Container()),
          Container(
            child: LongPressDraggable(
              data: PlayerList[n],
              feedback: feedbackContainer(PlayerList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {
                print("onDragUpdated");
              },
              onDragCompleted: () {
                // 여기에 추가
                print("onDragCompleted_player");
              },
              onDragEnd: (data) {
                print("onDragEnd");
              },
              onDragStarted: () {
                print("onDragStarted");
                temp = 'assets/images/champion_icon.jpg';
              },
              child: Container(
                  child: Image.asset(PlayerList[n], //3)
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
              right: 0, bottom: displayRatio * 2, child: PlayerName("PLAYER")),
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

// ignore: non_constant_identifier_names
Widget ChampionGrid(List _image) {
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
                onDragCompleted: () {
                  print("onDragCompleted");
                },
                onDragEnd: (data) {},
                onDragStarted: () {
                  temp = _image[index];
                  print("onDragStarted");
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

// ignore: non_constant_identifier_names
TextStyle TeamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 9,
      color: selectedColor);
}

// ignore: non_constant_identifier_names
TextStyle NameTextField() {
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

// ignore: non_constant_identifier_names
Widget TeamName(Color teamColor, String hintText) {
  return Container(
    width: displayWidth * 0.427,
    height: displayHeight * 0.05,
    decoration: myBoxDecoration(),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          hintStyle: TeamColor(teamColor),
          hintText: hintText,
          contentPadding: EdgeInsets.all(7)),
      style: TeamColor(teamColor),
    ),
  );
}

Widget PlayerName(String text) {
  return Container(
    height: 11,
    width: displayRatio * 40,
    child: Text(
      text,
      textAlign: TextAlign.right,
      style: NameTextField(),
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
              image: new AssetImage('assets/images/champion_icon.jpg'),
              fit: BoxFit.scaleDown)));
}
