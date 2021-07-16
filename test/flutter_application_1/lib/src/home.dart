import 'package:flutter/material.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/util.dart';
import 'dart:convert';

List topList = Champions.top;
List jugList = Champions.jug;
List midList = Champions.mid;
List botList = Champions.bot;
List supList = Champions.sup;

class Home extends StatefulWidget {
  @override
  State createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 175,
                  decoration: myBoxDecoration(),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        border: InputBorder.none,
                        hintStyle: RedTeam(),
                        hintText: 'Team Red'),
                    style: RedTeam(),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: myBoxDecoration(),
                  child: Text(
                    'Patch 11.12',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  width: 60,
                ),
                Container(
                  height: 40,
                  width: 176,
                  decoration: myBoxDecoration(),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintStyle: BlueTeam(),
                        hintText: 'Team Blue',
                        contentPadding: EdgeInsets.all(6),
                        border: InputBorder.none),
                    style: BlueTeam(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                BanContainer(),
                BanContainer(),
                BanContainer(),
                BanContainer(),
                BanContainer(),
                Container(
                  height: 42,
                  width: 60,
                  decoration: myBoxDecoration(),
                  child: Text(
                    'BAN',
                    style: TextStyle(fontSize: 20, color: SubColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                BanContainer(),
                BanContainer(),
                BanContainer(),
                BanContainer(),
                BanContainer(),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer()
                  ],
                ),
                Container(
                  height: 325,
                  width: 200,
                  decoration: BoxDecoration(
                      color: MainColor,
                      border: Border.all(color: SubColor),
                      image: DecorationImage(
                          image: new AssetImage('assets/images/map.jpg'),
                          fit: BoxFit.fitWidth)),
                ),
                Column(
                  children: [
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer(),
                    PlayerContainer()
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
                      TabBar(
                        indicator: BoxDecoration(color: SubColor),
                        labelStyle: RedTeam(),
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
                      Container(
                        height: 260,
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
        ),
      ),
    );
  }
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: MainColor,
    border: Border.all(color: SubColor),
  );
}

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

// ignore: non_constant_identifier_names
Container BanContainer() {
  return Container(
    height: 42,
    width: 35.1,
    decoration: myBoxDecoration(),
  );
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
