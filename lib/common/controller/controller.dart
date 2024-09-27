import 'package:flutter/material.dart';
import 'package:flutter_peso_online/common/constants/constants.dart';

class Controller extends GetxController {
  static Controller get to => Get.find();
  int count = 0;

  RxInt counter = 0.obs;
  RxDouble doubleNum = 0.0.obs;
  RxString string = "string".obs;
  RxList list = [].obs;
  RxMap map = {}.obs;
  RxBool boolean = true.obs;

  void increment() {
    debugPrint('点击了 ----');
    counter++;
  }

  void increment2() {
    count++;
    update();
  }
}
