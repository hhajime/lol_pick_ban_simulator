import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/src/provider/pickban_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  PickBanProvider _PickBanProvider;
  @override
  Widget build(BuildContext context) {
    _PickBanProvider = Provider.of<PickBanProvider>(context, listen: false);
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    displayRatio = displayHeight / displayWidth;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          FocusManager.instance.primaryFocus.unfocus(); // drawer시 textfield선택 x
          new TextEditingController().clear();
        },
        child: Scaffold(
            appBar: AppBar(
                title: Text("PICK BAN SIMULATOR"),
                brightness: Brightness.dark,
                backgroundColor: mainColor),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(color: mainColor)),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
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
                              child: Text(
                                'Patch 11.12',
                                style:
                                    TextStyle(fontSize: 8, color: Colors.white),
                                textAlign: TextAlign.center,
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
                              child: Text(
                                'BAN',
                                style: teamColor(subColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
                              height: displayHeight * 0.32,
                              width: displayWidth * 0.486,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  border: Border.all(color: subColor),
                                  image: DecorationImage(
                                      image: new AssetImage(
                                          'assets/images/map.jpg'),
                                      fit: BoxFit.fitWidth)),
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
                        Container(
                          color: mainColor,
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
                                  Container(
                                    height: displayHeight * 0.452,
                                    child: TabBarView(children: [
                                      championGrid(topList, topPlayerList),
                                      championGrid(jugList, jugPlayerList),
                                      championGrid(midList, midPlayerList),
                                      championGrid(botList, botPlayerList),
                                      championGrid(supList, supPlayerList),
                                    ]),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )))));
  }
}

Widget banContainer(List banList, String team, int n) {
  return Consumer<PickBanProvider>(builder: (context, provider, child) {
    return Container(
      width: displayWidth * 0.0853,
      height: displayHeight * 0.05,
      alignment: Alignment.center,
      decoration: myBoxDecoration(),
      child: DragTarget<String>(
        onWillAccept: (value) {
          banTemp = value;
          debugPrint(' dragtarget is ' + banList[n]);
          return true;
        },
        onAccept: (value) {
          targetTeam = team;
          if (trigger == 1) {
            debugPrint("[banContainer][onAccept][trigger = ${trigger}]");
            if (draggingTeam == targetTeam) {
              banList[tempNum] = banList[n];
              debugPrint('teamside is same');
            } else {
              debugPrint('teamside is opponent');
              if (team == 'red') {
                blueBan[tempNum] = banList[n];
              } else {
                redBan[tempNum] = banList[n];
              }
              debugPrint(" Target is " + banList[tempNum]);
            }
            ;
            banList[n] = dragging;
            provider.BanAdd();
          } else if (trigger == 2) {
            debugPrint("[banContainer][onAccept][trigger = ${trigger}]");
            if (draggingTeam == targetTeam) {
              debugPrint('teamside is same ' + team);
              if (team == 'red') {
                redPlayer[tempNum] = banList[n];
              } else {
                bluPlayer[tempNum] = banList[n];
              }
            } else {
              debugPrint('teamside is opponent');
              if (team == 'red') {
                bluPlayer[tempNum] = banList[n];
              } else {
                redPlayer[tempNum] = banList[n];
              }
              debugPrint(" Target is " + banList[tempNum]);
            }
            ;
            banList[n] = dragging;
            provider.BanAdd();
          } else if (trigger == 3) {
            debugPrint("[banContainer][onAccept][trigger = ${trigger}]");
            banList[n] = dragging;
            provider.BanAdd();
          }
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
                onDragUpdate: (update) {},
                onDragCompleted: () {},
                onDraggableCanceled: (v, f) =>
                    {banList[n] = champIcon, provider.BanAdd()},
                onDragStarted: () {
                  draggingTeam = team;
                  debugPrint("dragging team is " + draggingTeam);
                  trigger = 1;
                  dragging = banList[n];
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
  });
}

Widget playerContainer(List playerList, String team, int n) {
  return Consumer<PickBanProvider>(builder: (context, provider, child) {
    return Container(
      width: displayWidth * 0.257,
      height: displayHeight * 0.0641,
      child: DragTarget<String>(onWillAccept: (value) {
        return true;
      }, onAccept: (value) {
        targetTeam = team;
        if (trigger == 1) {
          debugPrint("[playerContainer][onAccept][trigger = ${trigger}]");
          if (draggingTeam == targetTeam) {
            debugPrint('teamside is same ' + team);
            if (team == 'red') {
              redBan[tempNum] = playerList[n];
            } else {
              blueBan[tempNum] = playerList[n];
            }
          } else {
            debugPrint('teamside is opponent');
            if (team == 'red') {
              blueBan[tempNum] = playerList[n];
            } else {
              redBan[tempNum] = playerList[n];
            }
            debugPrint(" Target is " + playerList[tempNum]);
          }
          ;
          playerList[n] = dragging;
          provider.PlayerAdd();
        } else if (trigger == 2) {
          debugPrint("[playerContainer][onAccept][trigger = ${trigger}]");
          if (draggingTeam == targetTeam) {
            playerList[tempNum] = playerList[n];
            debugPrint('teamside is same');
          } else {
            debugPrint('teamside is opponent');
            if (team == 'red') {
              bluPlayer[tempNum] = playerList[n];
            } else {
              redPlayer[tempNum] = playerList[n];
            }
            debugPrint(" Target is " + playerList[tempNum]);
          }
          ;
          playerList[n] = dragging;
          provider.PlayerAdd();
        } else if (trigger == 3) {
          debugPrint("[playerContainer][onAccept][trigger = ${trigger}]");
          playerList[n] = dragging;
          provider.PlayerAdd();
        }
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
                onDraggableCanceled: (v, f) =>
                    {playerList[n] = champIcon, provider.PlayerAdd()},
                onDragEnd: (data) {},
                onDragStarted: () {
                  draggingTeam = team;
                  trigger = 2;
                  dragging = playerList[n];
                  tempNum = n;
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
                right: 0,
                bottom: displayRatio * 2,
                child: playerName("PLAYER")),
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
  });
}

Widget championGrid(List _image, List _image2) {
  return Consumer<PickBanProvider>(builder: (context, provider, child) {
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: displayHeight / 1000,
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
                        debugPrint('complerte');
                        draggableState = true;
                        provider.GridAdd();
                      },
                      onDragEnd: (data) {},
                      onDragStarted: () {
                        debugPrint(draggableState.toString());
                        trigger = 3;
                        dragging = _image[index];
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
                    style: TextStyle(fontSize: 8, color: subColor),
                  ),
                ),
                height: 16,
                decoration: myBoxDecoration(),
              ))),
      decoration: myBoxDecoration(),
    );
  });
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

Widget gridContainer(con) {
  if (con != champIcon) {
    champName = con.substring(47).replaceAll('.jpg', '');
  }
  return Stack(children: [
    greyOutChampContainer(con),
    Container(
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
