
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ThemeController extends GetxController {


  RxBool isDarkMode = false.obs;

   toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _updateTheme();
  }

  void _updateTheme() {
     print("_updateTheme methid");
     Future.delayed(Duration.zero, () {
      Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
    });
  }
}