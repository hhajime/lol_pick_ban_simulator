import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            drawer: basicDrawer(),
            body: Container(
                margin: EdgeInsets.fromLTRB(1, displayHeight * 0.05, 0, 1),
                decoration: myTextBoxDecoration(5, mainColor, 30),
                child: Column(children: [
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
                                nameText('닉네임'),
                                nameTextFieldForm(8),
                                nameText('생년월일'),
                              ],
                            )
                          ],
                        ),
                      ))
                ]))));
  }
}
