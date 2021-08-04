import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              label: Text(
                '확인',
                style: titleLogo(displayRatio * 5, mainColor, FontStyle.normal),
              ),
              icon: Icon(
                Icons.check,
                size: displayRatio * 13,
                color: mainColor,
              ),
              onPressed: () {
                Get.to(() => managerMakingScreen(),
                    transition: Transition.rightToLeft);
              },
              backgroundColor: subColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
            ),
            backgroundColor: mainColor,
            resizeToAvoidBottomInset: false,
            appBar: basicAppBar(),
            body: Container(
                child: Column(children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: subColor, width: displayRatio * 2))),
                  margin: EdgeInsets.fromLTRB(
                      displayWidth * 0.15,
                      displayHeight * 0.05,
                      displayWidth * 0.15,
                      displayHeight * 0.05),
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
                  child: RawScrollbar(
                      thickness: displayRatio * 2,
                      thumbColor: subColor,
                      child: GridView.builder(
                          padding: EdgeInsets.fromLTRB(displayWidth * 0.05, 0,
                              displayWidth * 0.05, displayWidth * 0.05),
                          physics: BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: displayRatio / 2, // here2
                          ),
                          itemCount: (leaguesPng.length),
                          itemBuilder: (context, index) => GridTile(
                                child: AbsorbPointer(
                                    absorbing: false,
                                    child: Container(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.black,
                                              primary: mainColor,
                                              onPrimary: subColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              )),
                                          child: Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            height: displayHeight * 0.15,
                                            child: Image.asset(
                                              leaguesPng[index],
                                              color: subColor,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.put(UpdateController());
                                            mainColor = Color(0xFF063039);
                                            debugPrint(
                                                '${leaguesPng[index].substring(26).replaceAll('.png', '')}');
                                          },
                                        ),
                                        decoration: myTextBoxDecoration(
                                            displayWidth * 0.006,
                                            mainColor,
                                            25))),
                                footer: countryTextContainer(
                                    '${leaguesPng[index].substring(26).replaceAll('.png', '')}'),
                              ))))
            ]))));
  }
}
