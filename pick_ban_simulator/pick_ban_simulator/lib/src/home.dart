import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/util.dart';

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
                            teamName(Colors.red, "SKT T1"),
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
                            teamName(Colors.blue, "DAMWON"),
                          ],
                        ),
                        Row(
                          children: [
                            banContainer(bluTeam, 0),
                            banContainer(bluTeam, 1),
                            banContainer(bluTeam, 2),
                            banContainer(bluTeam, 3),
                            banContainer(bluTeam, 4),
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
                            banContainer(redTeam, 0),
                            banContainer(redTeam, 1),
                            banContainer(redTeam, 2),
                            banContainer(redTeam, 3),
                            banContainer(redTeam, 4),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                playerContainer(bluPlayer, 0),
                                playerContainer(bluPlayer, 1),
                                playerContainer(bluPlayer, 2),
                                playerContainer(bluPlayer, 3),
                                playerContainer(bluPlayer, 4)
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
                                playerContainer(redPlayer, 0),
                                playerContainer(redPlayer, 1),
                                playerContainer(redPlayer, 2),
                                playerContainer(redPlayer, 3),
                                playerContainer(redPlayer, 4)
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
                                      championGrid(topList),
                                      championGrid(jugList),
                                      championGrid(midList),
                                      championGrid(botList),
                                      championGrid(supList),
                                    ]),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )))));
  }
}
