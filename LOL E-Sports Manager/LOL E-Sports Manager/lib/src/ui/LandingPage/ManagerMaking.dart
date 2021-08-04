import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';

class managerMakingScreen extends StatefulWidget {
  @override
  State createState() => managerMakingState();
}

class managerMakingState extends State<StatefulWidget> {
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
            body: Container(
                margin: EdgeInsets.fromLTRB(1, displayHeight * 0.05, 0, 1),
                decoration: myTextBoxDecoration(5, mainColor, 30),
                child: Column(children: [
                  Container(
                    child: Image.asset(
                      'assets/images/customUi_managerMaking.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(
                              displayWidth * 0.1,
                              displayHeight * 0.03,
                              displayWidth * 0.1,
                              displayHeight * 0.03),
                          decoration: myTextBoxDecoration(4, mainColor, 10),
                          alignment: Alignment.center,
                          child: Text(
                            '감독 프로필 생성',
                            style: titleLogo(
                                displayRatio * 8, subColor, FontStyle.normal),
                          ))),
                  Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                nameText('이름'),
                                nameTextFieldForm(35),
                                nameText('별명'),
                                nameTextFieldForm(8),
                                nameText('나이'),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.05),
                                    margin: EdgeInsets.fromLTRB(
                                        displayWidth * 0.1,
                                        displayHeight * 0.01,
                                        displayWidth * 0.1,
                                        displayHeight * 0.01),
                                    decoration:
                                        myTextBoxDecoration(3, mainColor, 30),
                                    child: Row(children: [
                                      birth(selectYear, '1997'),
                                      birth(selectMonth, '04'),
                                      birth(selectDay, '23'),
                                      Text('세',
                                          style: titleLogo(displayRatio * 4,
                                              subColor, FontStyle.normal))
                                    ])),
                                nameText('성별'),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.05),
                                    margin: EdgeInsets.fromLTRB(
                                        displayWidth * 0.0,
                                        displayHeight * 0.01,
                                        displayWidth * 0.57,
                                        displayHeight * 0.01),
                                    decoration:
                                        myTextBoxDecoration(3, mainColor, 30),
                                    child: birth(sex, '남성')),
                                nameText('국적'),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.05),
                                    margin: EdgeInsets.fromLTRB(
                                        displayWidth * 0.05,
                                        displayHeight * 0.01,
                                        displayWidth * 0.55,
                                        displayHeight * 0.01),
                                    decoration:
                                        myTextBoxDecoration(3, mainColor, 30),
                                    child: birth(country, '대한민국')),
                                nameText('선호팀'),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.05),
                                    margin: EdgeInsets.fromLTRB(
                                        displayWidth * 0.08,
                                        displayHeight * 0.01,
                                        displayWidth * 0.55,
                                        displayHeight * 0.01),
                                    decoration:
                                        myTextBoxDecoration(3, mainColor, 30),
                                    child: birth(favTeam, 'T1')),
                                nameText('성향'),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: displayWidth * 0.05),
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    decoration:
                                        myTextBoxDecoration(3, mainColor, 30),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                  child: Text(
                                                '코칭',
                                                style: titleLogo(
                                                    displayRatio * 4,
                                                    Color(0x90C8AA6E),
                                                    FontStyle.normal),
                                              )),
                                              Row(
                                                children: [
                                                  Text('게임실력',
                                                      style: titleLogo(
                                                          displayRatio * 4,
                                                          Color(0xFFC8AA6E),
                                                          FontStyle.normal)),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('전술',
                                                      style: titleLogo(
                                                          displayRatio * 4,
                                                          Color(0xFFC8AA6E),
                                                          FontStyle.normal))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('선수훈련',
                                                      style: titleLogo(
                                                          displayRatio * 4,
                                                          Color(0xFFC8AA6E),
                                                          FontStyle.normal))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('피드백',
                                                      style: titleLogo(
                                                          displayRatio * 4,
                                                          Color(0xFFC8AA6E),
                                                          FontStyle.normal))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text('기타',
                                                  style: titleLogo(
                                                      displayRatio * 4,
                                                      Color(0x90C8AA6E),
                                                      FontStyle.normal)),
                                              Row(
                                                children: [
                                                  Text(
                                                    '지도력',
                                                    style: titleLogo(
                                                        displayRatio * 4,
                                                        subColor,
                                                        FontStyle.normal),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '멘탈',
                                                    style: titleLogo(
                                                        displayRatio * 4,
                                                        subColor,
                                                        FontStyle.normal),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '임기응변',
                                                    style: titleLogo(
                                                        displayRatio * 4,
                                                        subColor,
                                                        FontStyle.normal),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '관리',
                                                    style: titleLogo(
                                                        displayRatio * 4,
                                                        subColor,
                                                        FontStyle.normal),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '사회성',
                                                    style: titleLogo(
                                                        displayRatio * 4,
                                                        subColor,
                                                        FontStyle.normal),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ))
                ]))));
  }
}
