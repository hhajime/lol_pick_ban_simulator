import 'package:get/get.dart';
import 'package:flutter_application_1/src/list.dart';

class UpdateController extends GetxController {
  RxString testStr2 = "".obs;
  RxInt testInt = 0.obs;
  void Up() {
    update();
  }
}
