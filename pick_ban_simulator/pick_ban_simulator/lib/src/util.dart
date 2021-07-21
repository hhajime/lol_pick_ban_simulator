import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

ScrollController _scrollController;
Color caughtColor = Colors.red;
List _targetImage = List<String>.filled(10, null, growable: false);
List _bluPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List _redPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List redTeam =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List bluTeam =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
String temp;
int variableSet = 0;
double width;
double height;

// ignore: non_constant_identifier_names
Container BanContainer(int n) {
  return Container(
      child: DragTarget<String>(
        onAccept: (value) {
          _targetImage[n] = value;
        },
        builder: (_, candidateData, rejectedData) {
          return Container(
            width: 35.1,
            height: 48,
            alignment: Alignment.center,
            child: _targetImage[n] != null
                ? Image.asset(
                    _targetImage[n],
                    fit: BoxFit.cover,
                  )
                : Container(),
          );
        },
      ),
      width: displayWidth * 0.0853,
      height: displayHeight * 0.05,
      alignment: Alignment.center,
      decoration: myBoxDecoration());
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
Container ChampContainer2() {
  return Container(
      decoration: BoxDecoration(
          color: MainColor,
          image: DecorationImage(
              image: new AssetImage('assets/images/champion_icon.jpg'),
              fit: BoxFit.scaleDown)));
}

// ignore: non_constant_identifier_names
Container PlayerContainer(int n, String team, String savedTeam) {
  return Container(
    width: displayWidth * 0.257,
    height: displayHeight * 0.0641,
    child: DragTarget<String>(onWillAccept: (value) {
      return true;
    }, onAccept: (value) {
      print("onAccept");
      team = value;
      savedTeam = team;
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          Container(
              width: displayRatio * 40,
              height: displayRatio * 60,
              alignment: Alignment.center,
              child: team != null //1)
                  ? Image.asset(team, fit: BoxFit.cover)
                  : Container()),
          Container(
            child: LongPressDraggable(
              data: team,
              feedback: Container(
                  child: Image.asset(team, //2)
                      fit: BoxFit.cover,
                      height: 65,
                      width: 105.7)),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {
                print("onDragUpdated");
              },
              onDragCompleted: () {
                //여기에 추가
                print("onDragCompleted_player");
              },
              onDragEnd: (data) {
                // 여기에 추가
                print("onDragEnd");
              },
              onDragStarted: () {
                print("onDragStarted");
              },
              child: Container(
                  child: Image.asset(
                      team == temp
                          ? savedTeam
                          : 'assets/images/champion_icon.jpg', //3)
                      fit: BoxFit.cover,
                      height: displayRatio * 30,
                      width: 105.7)),
            ),
          ),
          Container(
              child: Opacity(
                  opacity: 0.5,
                  child: SvgPicture.asset(
                      'assets/images/player_background.svg', //3)
                      fit: BoxFit.fitWidth,
                      height: displayRatio * 30,
                      width: 105.7))),
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
                  data: _image[index],
                  feedback: Container(
                    child: Image.asset(_image[index],
                        fit: BoxFit.cover, height: 100, width: 80),
                    decoration: myBoxDecoration(),
                  ),
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
            )),
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
      color: SubColor);
}

Container gridContainer(gridList, index) {
  return Container(
      child: Image.asset(gridList[index],
          fit: BoxFit.cover, height: height, width: width),
      decoration: myBoxDecoration());
}

// ignore: non_constant_identifier_names
Container TeamName(Color teamColor, String hintText) {
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
      style: TeamColor(Colors.blue),
    ),
  );
}

Container PlayerName(String text) {
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
