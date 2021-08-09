import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';
import 'package:flutter_application_1/src/ui/LandingPage/teamMaking.dart';

class managerMakingScreen extends StatelessWidget {
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
                              displayWidth * 0.17,
                              displayHeight * 0.03,
                              displayWidth * 0.17,
                              displayHeight * 0.03),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: subColor,
                                      width: displayRatio * 2))),
                          alignment: Alignment.center,
                          child: Text(
                            '감독 프로필 생성',
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
                                  nameText('이름', 0.7),
                                  nameTextFieldForm(35),
                                  nameText('별명', 0.7),
                                  nameTextFieldForm(12),
                                  nameText('나이', 0.7),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(
                                          displayWidth * 0.04,
                                          0,
                                          displayWidth * 0.05,
                                          displayHeight * 0.002),
                                      child: DatePickerWidget(
                                        looping:
                                            false, // default is not looping
                                        firstDate: DateTime(1990, 01, 01),
                                        lastDate: DateTime(2021, 12, 31),
                                        initialDate: DateTime(1991, 10, 12),
                                        dateFormat: "dd-MMM-yyyy",
                                        locale:
                                            DatePicker.localeFromString('ko'),
                                        onChange: (DateTime newDate, _) =>
                                            _selectedDate = newDate,
                                        pickerTheme: DateTimePickerTheme(
                                            itemTextStyle: TextStyle(
                                                color: subColor,
                                                fontSize: displayHeight * 0.02),
                                            dividerColor: subColor,
                                            backgroundColor: mainColor),
                                      )),
                                  nameText('성별', 0.7),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                displayWidth * 0.1, 0, 0, 0),
                                            child: genderButton("남성")),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                displayWidth * 0.05, 0, 0, 0),
                                            child: genderButton("여성"))
                                      ],
                                    ),
                                  ),
                                  nameText('국적', 0.7),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: displayWidth * 0.1),
                                    child: CountryListPick(
                                        appBar: AppBar(
                                          backgroundColor: mainColor,
                                          title: Text('국적 선택'),
                                        ),
                                        pickerBuilder:
                                            (context, CountryCode countryCode) {
                                          return Row(
                                            children: [
                                              Image.asset(
                                                countryCode.flagUri,
                                                scale: displayHeight * 0.01,
                                                package: 'country_list_pick',
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: displayWidth * 0.03,
                                                ),
                                                child: Text(
                                                  countryCode.name,
                                                  style: TextStyle(
                                                      color: subColor,
                                                      fontSize: displayHeight *
                                                          0.017),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        theme: CountryTheme(
                                          alphabetSelectedBackgroundColor:
                                              mainColor,
                                          alphabetTextColor: mainColor,
                                          isShowFlag: true,
                                          isShowTitle: true,
                                          isShowCode: true,
                                          isDownIcon: true,
                                          showEnglishName: true,
                                        ),
                                        // Set default value
                                        initialSelection: '+82',
                                        onChanged: (CountryCode code) {
                                          print(code.name);
                                          print(code.code);
                                          print(code.dialCode);
                                          print(code.flagUri);
                                        },
                                        useUiOverlay: true,
                                        useSafeArea: false),
                                  ),
                                  nameText('성향', 0.7),
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
                                                traitButton('#포로 출신'),
                                                traitButton('#전술가'),
                                                traitButton('#숙련된 코칭'),
                                                traitButton('#피드백'),
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
                                                traitButton('#지도자'),
                                                traitButton('#강철 멘탈'),
                                                traitButton('#관리자'),
                                                traitButton('#인사이더'),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          displayWidth * 0.32,
                                          displayHeight * 0.02,
                                          displayWidth * 0.32,
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
                                        child: Row(children: [
                                          Text(
                                            '프로필 확정',
                                            style: titleLogo(displayRatio * 4,
                                                mainColor, FontStyle.normal),
                                          ),
                                          Icon(Icons.check)
                                        ]),
                                        onPressed: () {
                                          Get.to(() => teamMakingScreen(),
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

  Widget traitText(trait) {
    return Text(
      trait,
      style: titleLogo(displayRatio * 3, subColor, FontStyle.normal),
    );
  }
}
