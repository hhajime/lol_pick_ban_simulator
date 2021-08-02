import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: displayHeight / 1000, // here2
                          ),
                          itemCount: (leaguesPng.length),
                          itemBuilder: (context, index) => GridTile(
                                child: AbsorbPointer(
                                    absorbing: false,
                                    child: Container(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: mainColor,
                                              onPrimary: subColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0),
                                              )),
                                          child: Container(
                                            height: displayHeight * 0.15,
                                            child: Image.asset(
                                              leaguesPng[index],
                                              color: subColor,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.put(UpdateController());
                                            debugPrint(
                                                '${leaguesPng[index].substring(26).replaceAll('.png', '')}');
                                          },
                                        ),
                                        decoration: myTextBoxDecoration(
                                            displayWidth * 0.006, 25))),
                                footer: countryTextContainer(
                                    '${leaguesPng[index].substring(26).replaceAll('.png', '')}'),
                              ))))
            ]))));
  }
}
