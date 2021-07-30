import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/src/provider/pickban_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    displayRatio = displayHeight / displayWidth;
    debugPrint(displayRatio.toString());

    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          FocusManager.instance.primaryFocus.unfocus();
          new TextEditingController().clear();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: basicAppBar(),
          drawer: Drawer(
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
                    style: teamColor(mainColor),
                  ),
                  trailing: Icon(
                    Icons.drag_handle,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  dense: true,
                  onTap: () {
                    Navigator.pop(context);
                    for (int i = 0; i < 5; i++) {
                      bluPlayer[i] = champIcon;
                      blueBan[i] = champIcon;
                      redPlayer[i] = champIcon;
                      redBan[i] = champIcon;
                    }
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.delete_forever_outlined,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  title: Text(
                    'Delete All',
                    style: teamColor(mainColor),
                  ),
                  trailing: Icon(
                    Icons.drag_handle,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  dense: true,
                  onTap: () {
                    Navigator.pop(context);
                    for (int i = 0; i < 5; i++) {
                      bluPlayer[i] = champIcon;
                      blueBan[i] = champIcon;
                      redPlayer[i] = champIcon;
                      redBan[i] = champIcon;
                    }
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          body: Container(
              width: displayWidth,
              height: displayHeight,
              child: Column(
                children: [
                  Row(
                    children: [
                      teamName(Colors.blue, "DAMWON"),
                      Container(
                        height: displayHeight * 0.05,
                        decoration: myBoxDecoration(),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(
                              0, displayHeight * 0.035, 0, 0),
                          child: Text(
                            'Patch 11.12',
                            style: TextStyle(fontSize: 8, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        width: displayWidth * 0.146,
                      ),
                      teamName(Colors.red, "SKT T1"),
                    ],
                  ),
                  Row(
                    children: [
                      banContainer(blueBan, 'blue', 0),
                      banContainer(blueBan, 'blue', 1),
                      banContainer(blueBan, 'blue', 2),
                      banContainer(blueBan, 'blue', 3),
                      banContainer(blueBan, 'blue', 4),
                      Container(
                          width: displayWidth * 0.1465,
                          height: displayHeight * 0.05,
                          decoration: myBoxDecoration(),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0, displayHeight * 0.01, 0, 0),
                            child: Text(
                              'BANS',
                              style: teamColor(subColor),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      banContainer(redBan, 'red', 0),
                      banContainer(redBan, 'red', 1),
                      banContainer(redBan, 'red', 2),
                      banContainer(redBan, 'red', 3),
                      banContainer(redBan, 'red', 4),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          playerContainer(bluPlayer, 'blue', 0),
                          playerContainer(bluPlayer, 'blue', 1),
                          playerContainer(bluPlayer, 'blue', 2),
                          playerContainer(bluPlayer, 'blue', 3),
                          playerContainer(bluPlayer, 'blue', 4)
                        ],
                      ),
                      Container(
                        child: InteractiveViewer(
                          child: Container(
                            height: displayHeight * 0.43,
                            width: displayWidth * 0.66,
                            decoration: BoxDecoration(
                                color: mainColor,
                                border: Border.all(color: subColor),
                                image: DecorationImage(
                                    image:
                                        new AssetImage('assets/images/map.jpg'),
                                    fit: BoxFit.fitWidth)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          playerContainer(redPlayer, 'red', 0),
                          playerContainer(redPlayer, 'red', 1),
                          playerContainer(redPlayer, 'red', 2),
                          playerContainer(redPlayer, 'red', 3),
                          playerContainer(redPlayer, 'red', 4)
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                        length: 5,
                        child: Column(
                          children: [
                            Container(
                              child: TabBar(
                                indicator: BoxDecoration(color: subColor),
                                labelStyle: teamColor(subColor),
                                unselectedLabelColor: subColor,
                                indicatorColor: mainColor,
                                labelColor: Colors.white,
                                tabs: [
                                  Tab(text: 'TOP'),
                                  Tab(text: 'JG'),
                                  Tab(text: 'MID'),
                                  Tab(text: 'BOT'),
                                  Tab(text: 'SUP')
                                ],
                              ),
                              decoration: myTabBoxDecoration(),
                            ),
                            Expanded(
                              flex: 1,
                              child: TabBarView(children: [
                                championGrid(topList, topPlayerList),
                                championGrid(jugList, jugPlayerList),
                                championGrid(midList, midPlayerList),
                                championGrid(botList, botPlayerList),
                                championGrid(supList, supPlayerList),
                              ]),
                            ),
                          ],
                        )),
                  ),
                ],
              )),
        ));
  }
}

Widget banContainer(List banList, String team, int n) {
  return Container(
    width: displayWidth * 0.0853,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: DragTarget<String>(
      onWillAccept: (value) {
        banTemp = value;
        return true;
      },
      onAccept: (value) {
        targetTeam = team;
        if (trigger == 1) {
          if (draggingTeam == targetTeam) {
            banList[tempNum] = banList[n];
          } else {
            if (team == 'red') {
              blueBan[tempNum] = banList[n];
            } else {
              redBan[tempNum] = banList[n];
            }
          }
          ;
          banList[n] = dragging1;
          //add Update
        } else if (trigger == 2) {
          if (draggingTeam == targetTeam) {
            if (team == 'red') {
              redPlayer[tempNum] = banList[n];
            } else {
              bluPlayer[tempNum] = banList[n];
            }
          } else {
            if (team == 'red') {
              bluPlayer[tempNum] = banList[n];
            } else {
              redPlayer[tempNum] = banList[n];
            }
          }
          ;
          banList[n] = dragging1;
          //add Update
        } else if (trigger == 3) {
          banList[n] = dragging1;
          //add Update
        }
      },
      builder: (_, candidateData, rejectedData) {
        return Stack(children: [
          Container(
            width: displayWidth * 0.0853,
            height: displayHeight * 0.05,
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
              onDragUpdate: (update) {},
              onDragCompleted: () {},
              onDraggableCanceled: (v, f) => {
                banList[n] = champIcon, //add Update
              },
              onDragStarted: () {
                draggingTeam = team;
                trigger = 1;
                dragging1 = banList[n];
                tempNum = n;
              },
              child: Container(
                  child: Image.asset(banList[n], //3)
                      fit: BoxFit.cover,
                      width: displayWidth * 0.0853,
                      height: displayHeight * 0.05)),
            ),
          ),
        ]);
      },
    ),
  );
}

Widget playerContainer(List playerList, String team, int n) {
  return Container(
    width: displayWidth * 0.17,
    height: displayHeight * 0.086,
    child: DragTarget<String>(onWillAccept: (value) {
      return true;
    }, onAccept: (value) {
      targetTeam = team;
      if (trigger == 1) {
        if (draggingTeam == targetTeam) {
          if (team == 'red') {
            redBan[tempNum] = playerList[n];
          } else {
            blueBan[tempNum] = playerList[n];
          }
        } else {
          if (team == 'red') {
            blueBan[tempNum] = playerList[n];
          } else {
            redBan[tempNum] = playerList[n];
          }
        }
        ;
        playerList[n] = dragging1; //add Update
      } else if (trigger == 2) {
        if (draggingTeam == targetTeam) {
          playerList[tempNum] = playerList[n];
        } else {
          if (team == 'red') {
            bluPlayer[tempNum] = playerList[n];
          } else {
            redPlayer[tempNum] = playerList[n];
          }
        }
        ;
        playerList[n] = dragging1; //add Update
      } else if (trigger == 3) {
        playerList[n] = dragging1; //add Update
      }
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          Container(alignment: Alignment.center, child: Container()),
          Container(
            child: LongPressDraggable(
              data: playerList[n],
              feedback: feedbackContainer(playerList[n]),
              childWhenDragging: ChampContainer2(),
              onDragUpdate: (team) {},
              onDragCompleted: () {},
              onDraggableCanceled: (v, f) => {
                playerList[n] = champIcon, //add Update
              },
              onDragEnd: (data) {},
              onDragStarted: () {
                draggingTeam = team;
                trigger = 2;
                dragging1 = playerList[n];
                tempNum = n;
              },
              child: Container(
                  child: Image.asset(
                playerList[n], //3)
                fit: BoxFit.cover,
                width: displayWidth * 0.17,
                height: displayHeight * 0.086,
              )),
            ),
          ),
          Positioned(
            top: 1,
            child: IgnorePointer(
                child: Container(
                    child: Opacity(
                        opacity: 1,
                        child: SvgPicture.asset(
                            'assets/images/player_background.svg', //3)
                            fit: BoxFit.cover,
                            width: displayWidth * 0.17,
                            height: displayHeight * 0.086)))),
          ),
          Positioned(right: 0, bottom: 0, child: playerName("PLAYER")),
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

Widget championGrid(List _image, List _image2) {
  return Container(
    child: Scrollbar(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: displayHeight / 980, // here2
          ),
          itemCount: (_image.length),
          itemBuilder: (context, index) => GridTile(
              child: AbsorbPointer(
                  absorbing: false,
                  child: LongPressDraggable(
                      data: _image[index],
                      feedback: feedbackContainer(_image[index]),
                      childWhenDragging: greyOutChampContainer(_image[index]),
                      onDragCompleted: () {
                        draggableState = true;
                        //add Update
                      },
                      onDragEnd: (data) {},
                      onDragStarted: () {
                        trigger = 3;
                        dragging1 = _image[index];
                        dragging2 = _image2[index];
                        dragging3 = _image[index];
                      },
                      onDragUpdate: (data) {},
                      child: gridContainer(_image[index]))),
              footer: Container(
                child: GridTileBar(
                  backgroundColor: mainColor,
                  subtitle: Text(
                    '$champName',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8,
                        color: subColor,
                        fontFamily: 'SegoeUI',
                        fontStyle: FontStyle.italic),
                  ),
                ),
                height: 18,
                decoration: myBoxDecoration(),
              ))),
    ),
    color: mainColor,
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
