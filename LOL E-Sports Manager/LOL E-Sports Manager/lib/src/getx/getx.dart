import 'package:get/get.dart';
import 'package:flutter_application_1/src/list.dart';

class UpdateController extends GetxController {
  RxString testStr2 = "".obs;
  RxInt testInt = 0.obs;
  List bluPlayer = List<String>.filled(5, champIcon, growable: false).obs;
  List redPlayer = List<String>.filled(5, champIcon, growable: false).obs;
  List blueBan = List<String>.filled(5, champIcon, growable: false).obs;
  List redBan = List<String>.filled(5, champIcon, growable: false).obs;
  void Up() {
    update();
  }
}
