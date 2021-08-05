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
    final upController = Get.put(UpdateController());
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
                margin: EdgeInsets.fromLTRB(1, displayHeight * 0.05, 0, 1),
                decoration: myTextBoxDecoration(5, mainColor, 20),
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
                      child: RawScrollbar(
                        thickness: displayRatio * 2,
                        thumbColor: subColor,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
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
                                        dropDownBtn(selectYear, '1997',
                                            birthYear, birthYear2),
                                        dropDownBtn(selectMonth, '04',
                                            birthMonth, birthMonth2),
                                        dropDownBtn(selectDay, '23', birthDay,
                                            birthDay2),
                                        Obx(() => Text(
                                            '   :  ${upController.testInt.value}세',
                                            style: titleLogo(displayRatio * 4,
                                                subColor, FontStyle.normal)))
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
                                      child: dropDownBtn(
                                          sex, '남성', playerSex, playerSex2)),
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
                                      child: dropDownBtn(country, '대한민국',
                                          playerCountry, playerCountry2)),
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
                                      child: dropDownBtn(
                                          favTeam, 'T1', hopeTeam, hopeTeam2)),
                                  nameText('성향'),
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
                                                    traitText('게임실력'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [traitText('전술')],
                                                ),
                                                Row(
                                                  children: [traitText('선수훈련')],
                                                ),
                                                Row(
                                                  children: [traitText('피드백')],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Container(
                                                    child: Text('기타',
                                                        style: titleLogo(
                                                            displayRatio * 4,
                                                            Color(0x90C8AA6E),
                                                            FontStyle.normal))),
                                                Row(
                                                  children: [traitText('지도력')],
                                                ),
                                                Row(
                                                  children: [traitText('멘탈')],
                                                ),
                                                Row(
                                                  children: [traitText('임기응변')],
                                                ),
                                                Row(
                                                  children: [traitText('관리')],
                                                ),
                                                Row(
                                                  children: [traitText('사회성')],
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
                        ),
                      ))
                ]))));
  }

  Widget traitText(trait) {
    return Text(
      trait,
      style: titleLogo(displayRatio * 3, subColor, FontStyle.normal),
    );
  }

  Widget dropDownBtn(List date, String hint, catagory, catagory2) {
    final upController = Get.put(UpdateController());
    return Container(
        margin: EdgeInsets.fromLTRB(0, displayHeight * 0.006,
            displayWidth * 0.02, displayHeight * 0.006),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: subColor,
            ),
            dropdownColor: subColor,
            isDense: true,
            hint: Text(
              hint,
              style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
            ),
            onChanged: (value) {
              catagory2 = value;
              upController.testInt.value++;
              if (catagory == birthYear) {
                testStr = (2022 - int.parse(catagory2)).toString().obs;
              } else
                testStr = catagory2.toString().obs;
            },
            value: catagory2,
            items: date.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: TextStyle(color: mainColor)),
              );
            }).toList(),
          ),
        ));
  }
}
