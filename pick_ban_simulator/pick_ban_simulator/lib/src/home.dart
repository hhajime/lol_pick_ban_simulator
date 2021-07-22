import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/util.dart';

List topList = Champions.top;
List jugList = Champions.jug;
List midList = Champions.mid;
List botList = Champions.bot;
List supList = Champions.sup;

List _bluPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List _redPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List redTeam =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List bluTeam =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);

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
                backgroundColor: MainColor),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(color: MainColor)),
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
                            TeamName(Colors.red, "SKT T1"),
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
                            TeamName(Colors.blue, "DAMWON"),
                          ],
                        ),
                        Row(
                          children: [
                            BanContainer(bluTeam, 0),
                            BanContainer(bluTeam, 1),
                            BanContainer(bluTeam, 2),
                            BanContainer(bluTeam, 3),
                            BanContainer(bluTeam, 4),
                            Container(
                              width: displayWidth * 0.1465,
                              height: displayHeight * 0.05,
                              decoration: myBoxDecoration(),
                              child: Text(
                                'BAN',
                                style: TeamColor(SubColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            BanContainer(redTeam, 0),
                            BanContainer(redTeam, 1),
                            BanContainer(redTeam, 2),
                            BanContainer(redTeam, 3),
                            BanContainer(redTeam, 4),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                PlayerContainer(_bluPlayer, 0),
                                PlayerContainer(_bluPlayer, 1),
                                PlayerContainer(_bluPlayer, 2),
                                PlayerContainer(_bluPlayer, 3),
                                PlayerContainer(_bluPlayer, 4)
                              ],
                            ),
                            Container(
                              height: displayHeight * 0.32,
                              width: displayWidth * 0.486,
                              decoration: BoxDecoration(
                                  color: MainColor,
                                  border: Border.all(color: SubColor),
                                  image: DecorationImage(
                                      image: new AssetImage(
                                          'assets/images/map.jpg'),
                                      fit: BoxFit.fitWidth)),
                            ),
                            Column(
                              children: [
                                PlayerContainer(_redPlayer, 0),
                                PlayerContainer(_redPlayer, 1),
                                PlayerContainer(_redPlayer, 2),
                                PlayerContainer(_redPlayer, 3),
                                PlayerContainer(_redPlayer, 4)
                              ],
                            )
                          ],
                        ),
                        Container(
                          color: MainColor,
                          child: DefaultTabController(
                              length: 5,
                              child: Column(
                                children: [
                                  Container(
                                    child: TabBar(
                                      indicator: BoxDecoration(color: SubColor),
                                      labelStyle: TeamColor(SubColor),
                                      unselectedLabelColor: SubColor,
                                      indicatorColor: MainColor,
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
                                    height: displayHeight * 0.455,
                                    child: TabBarView(children: [
                                      ChampionGrid(topList),
                                      ChampionGrid(jugList),
                                      ChampionGrid(midList),
                                      ChampionGrid(botList),
                                      ChampionGrid(supList),
                                    ]),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )))));
  }
}
