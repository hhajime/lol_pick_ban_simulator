import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatefulWidget {
  @override
  State createState() => LandingState();
}

class LandingState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    displayRatio = displayHeight / displayWidth;
    int _page = 0;
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
                  ),
                  trailing: Icon(
                    Icons.drag_handle,
                    size: displayRatio * 20,
                    color: mainColor,
                  ),
                  dense: true,
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          body: Container(
            margin: EdgeInsets.fromLTRB(20, 180, 20, 180),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: myTextBoxDecoration(),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    '<감사의 편지>\n\n환영합니다! \n League of Legends e-sports manager를 다운로드해 주셔서 감사합니다. \n이 게임은 기본적으로 리그 오브 레전드 E-스포츠 리그의 전지적 감독시점을 배경으로 게임이 진행하도록 설계되었습니다.\n각 국가에 속해있는 수많은 리그와 그 안에 포함되어 있는 다양한 선수(헌역 및 은퇴선수)들을 수집하고 경기를 위한 전력을 분석해 스크림 및 밴픽을 진행하여 경기를 치루게 됩니다. \n선수들의 스탯은 현실 리그에 영향을 받아 매 시즌마다 업데이트 되며 상승 또는 하락이 될 수 있습니다. \n스탯을 직접적으로 조정할 수는 없으나, 코칭을 포함한 전반적인 생활이나 건강관리를 진행하여 스탯을 보정할 수 있습니다. \n경기뿐만이 아닌 각 선수의 특성에 맞는 선수단 운영에 필요한 예산과 프론트와 선수단 사이에서의 관계를 조율하고 구단에 명성에 걸맞는 스폰서와 계약을 체결하는 등의 방식으로 구단에 필요한 예산을 확보할 수 있습니다.\n이외에도 다양한 컨텐츠를 준비하고 지속적인 업데이트로 발전하는 게임을 보여드림을 약속드리며 감사의 인사를 마칩니다.',
                    style: titleLogo(8, subColor, FontStyle.italic),
                  ),
                  Container(
                      padding:
                          EdgeInsets.fromLTRB(displayWidth * 0.58, 10, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: subColor,
                            onPrimary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            )),
                        child: Row(children: [
                          Text(
                            '확인',
                            style: titleLogo(8, mainColor, FontStyle.normal),
                          ),
                          Icon(Icons.check)
                        ]),
                        onPressed: () {
                          debugPrint("click");
                        },
                      )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: ConvexAppBar(
              backgroundColor: subColor,
              style: TabStyle.flip,
              color: mainColor,
              items: [
                TabItem(
                    icon: Icon(Icons.home, size: displayRatio * 15),
                    title: 'Home'),
                TabItem(
                    icon: Icon(Icons.paste, size: displayRatio * 15),
                    title: 'Tactic'),
                TabItem(
                    icon: Icon(Icons.sports_esports, size: displayRatio * 15),
                    title: 'Play'),
                TabItem(
                    icon: Icon(Icons.manage_accounts, size: displayRatio * 15),
                    title: 'Manage'),
                TabItem(
                    icon: Icon(Icons.work, size: displayRatio * 15),
                    title: 'Work'),
              ]),
        ));
  }
}
