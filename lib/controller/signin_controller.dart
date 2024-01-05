import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/sign_in&sign_up/sign_in.dart';
import 'package:fodddelieveryapp/sign_in&sign_up/sign_out.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  var selectedTab = 0.obs;
  List<Widget> tabContents = [
    const SigninPage(),
    const SignUPPage(),
  ];

  void selectTab(int index) {
    selectedTab.value = index;
  }
}
