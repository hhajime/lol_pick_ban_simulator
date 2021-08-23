import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/list.dart';
import 'package:flutter_application_1/src/ui/BanPick.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: mainColor,
          resizeToAvoidBottomInset: false,
          appBar: basicAppBar(),
          drawer: basicDrawer(),
          body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 25,
                      decoration: myBoxDecoration(),
                      child: Icon(
                        Icons.article,
                        color: subColor,
                      ),
                    ),
                    Container(
                      decoration: myBoxDecoration(),
                      height: 25,
                      width: displayWidth * 0.925,
                      child: Marquee(
                          style: TextStyle(color: subColor),
                          text:
                              '/ [LPL 노트] 신인 미드 내세운 RNG, 파죽의 7연승 행진 / [LCK] 리브, 젠지·T1 꺾고 3연승 플옵 윤곽 잡혔다…LCK 서머 7주차'),
                    )
                  ],
                ),
                Container(
                    width: displayWidth * 1,
                    height: displayHeight * 0.2,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: ListWheelScrollView(
                          physics: FixedExtentScrollPhysics(),
                          useMagnifier: false,
                          magnification: 1.1,
                          itemExtent: displayWidth * 0.5,
                          children: [
                            Rot(),
                            Rot(),
                            Rot(),
                            Rot(),
                          ],
                        ))),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.01,
                      displayHeight * 0.01,
                      displayWidth * 0.01,
                      displayHeight * 0.01),
                  height: displayHeight * 0.15,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: playerCard(),
                        ),
                      ),
                      Container(
                        width: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: playerCard(),
                        ),
                      ),
                      Container(
                        width: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: playerCard(),
                        ),
                      ),
                      Container(
                        width: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: playerCard(),
                        ),
                      ),
                      Container(
                        width: 1,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: playerCard(),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: displayHeight * 0.4487,
                        decoration: myBoxDecoration(),
                        /*child: Text(
                          '정규 순위',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: subColor,
                              fontSize: displayHeight * 0.04,
                              fontFamily: 'SegoeUI',
                              fontWeight: FontWeight.w700),
                        ),*/
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: displayHeight * 0.4487,
                        decoration: myBoxDecoration(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: subColor,
            style: TabStyle.flip,
            onTap: (index) {
              switch (index) {
                case 0:
                  Get.to(() => HomeScreen());
                  break;
                case 1:
                  Get.to(() => Home());
                  break;
              }
            },
            color: mainColor,
            activeColor: Colors.white,
            items: [
              TabItem(
                icon: Icon(
                  Icons.home,
                  size: displayRatio * 15,
                  color: mainColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: displayRatio * 15,
                  color: Colors.white,
                ),
                title: 'Home',
              ),
              TabItem(
                  icon: Icon(
                    Icons.paste,
                    size: displayRatio * 15,
                    color: mainColor,
                  ),
                  title: 'Tactic'),
              TabItem(
                  icon: Icon(
                    Icons.sports_esports,
                    size: displayRatio * 15,
                    color: mainColor,
                  ),
                  title: 'Game'),
              TabItem(
                  icon: Icon(
                    Icons.manage_accounts,
                    size: displayRatio * 15,
                    color: mainColor,
                  ),
                  title: 'Manage'),
              TabItem(
                  icon: Icon(
                    Icons.work,
                    size: displayRatio * 15,
                    color: mainColor,
                  ),
                  title: 'Work'),
            ],
          ),
        ));
  }
}
