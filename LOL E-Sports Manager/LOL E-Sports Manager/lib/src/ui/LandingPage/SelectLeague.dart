import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';
import 'package:flutter_application_1/src/ui/LandingPage/managerMaking.dart';

class SelectLeagueScreen extends StatefulWidget {
  @override
  State createState() => SelectLeagueState();
}

class SelectLeagueState extends State<StatefulWidget> {
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
                child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      displayWidth * 0.15,
                      displayHeight * 0.05,
                      displayWidth * 0.15,
                      displayHeight * 0.05),
                  decoration: myTextBoxDecoration(displayWidth * 0.006, 25),
                  alignment: Alignment.center,
                  child: Text(
                    '리그 선택',
                    style:
                        titleLogo(displayRatio * 8, subColor, FontStyle.normal),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Scrollbar(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            Row(children: [
                              Expanded(flex: 1, child: leagueContainer('lck')),
                              Expanded(
                                flex: 1,
                                child: leagueContainer('lpl'),
                              )
                            ]),
                            Row(children: [
                              Expanded(
                                  flex: 1, child: countryTextContainer('한국')),
                              Expanded(
                                  flex: 1, child: countryTextContainer('중국'))
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: leagueContainer('lec')),
                                Expanded(
                                  flex: 1,
                                  child: leagueContainer('lcs'),
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                  flex: 1, child: countryTextContainer('유럽')),
                              Expanded(
                                  flex: 1, child: countryTextContainer('북미'))
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: leagueContainer('tcl')),
                                Expanded(
                                  flex: 1,
                                  child: leagueContainer('cblol'),
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                  flex: 1, child: countryTextContainer('터키')),
                              Expanded(
                                  flex: 1, child: countryTextContainer('브라질'))
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: leagueContainer('ljl')),
                                Expanded(
                                  flex: 1,
                                  child: leagueContainer('lla'),
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                  flex: 1, child: countryTextContainer('일본')),
                              Expanded(
                                  flex: 1,
                                  child: countryTextContainer('라틴아메리카'))
                            ]),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1, child: leagueContainer('lco')),
                                Expanded(
                                  flex: 1,
                                  child: leagueContainer('lcl'),
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: countryTextContainer('오세아니아')),
                              Expanded(
                                  flex: 1,
                                  child: countryTextContainer('독립국가연합'))
                            ]),
                            Container(
                                padding: EdgeInsets.fromLTRB(
                                    displayWidth * 0.1,
                                    displayHeight * 0.02,
                                    displayWidth * 0.1,
                                    displayHeight * 0.05),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: subColor,
                                        onPrimary: mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        )),
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          displayWidth * 0.3, 0, 0, 0),
                                      child: Row(children: [
                                        Text(
                                          '확인',
                                          style: titleLogo(displayRatio * 4,
                                              mainColor, FontStyle.normal),
                                        ),
                                        Icon(Icons.check)
                                      ]),
                                    ),
                                    onPressed: () {
                                      Get.to(() => managerMakingScreen());
                                      debugPrint("click");
                                    }))
                          ]))))
            ]))));
  }
}
