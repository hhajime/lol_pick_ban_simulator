import 'package:get/get.dart';
import 'package:flutter_application_1/src/list.dart';

class UpdateController extends GetxController {
  RxString testStr2 = "".obs;
  RxString catagory2 = "".obs;
  RxInt testInt = 0.obs;
  RxList bluPlayer = List<String>.filled(5, champIcon, growable: false).obs;
  RxList redPlayer = List<String>.filled(5, champIcon, growable: false).obs;
  RxList blueBan = List<String>.filled(5, champIcon, growable: false).obs;
  RxList redBan = List<String>.filled(5, champIcon, growable: false).obs;
  void Up() {
    update();
  }
}
