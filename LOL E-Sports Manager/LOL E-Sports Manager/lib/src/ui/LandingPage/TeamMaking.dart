import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/list.dart';
import 'package:flutter_application_1/src/ui/Home/home.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';

class teamMakingScreen extends StatelessWidget {
  DateTime _selectedDate;
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
            body: Container(
                margin: EdgeInsets.fromLTRB(1, displayHeight * 0.00, 0, 1),
                decoration: myTextBoxDecoration(5, mainColor, 20),
                child: Column(children: [
                  /*Container(
                    child: Image.asset(
                      'assets/images/customUi_managerMaking.png',
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(
                              displayWidth * 0.3,
                              displayHeight * 0.03,
                              displayWidth * 0.3,
                              displayHeight * 0.03),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: subColor,
                                      width: displayRatio * 2))),
                          alignment: Alignment.center,
                          child: Text(
                            '팀 생성',
                            style: titleLogo(displayHeight * 0.02, subColor,
                                FontStyle.normal),
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
                                  nameText('팀 이름', 0.6),
                                  nameTextFieldForm(35),
                                  nameText('팀 로고', 0.6),
                                  nameText('스폰서', 0.61),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          displayWidth * 0.32,
                                          displayHeight * 0.02,
                                          displayWidth * 0.39,
                                          0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: subColor,
                                            onPrimary: mainColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0),
                                            )),
                                        child: Center(
                                          child: Text(
                                            '팀 확정',
                                            style: titleLogo(displayRatio * 4,
                                                mainColor, FontStyle.normal),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.to(() => HomeScreen(),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                ]))));
  }
}
