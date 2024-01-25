import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get/get.dart';

class LoginTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;

  final List<Tab> logintab = <Tab>[
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: colorOrange, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sign-up',
            style: TextStyle(
                color: colorOrange, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    ),
  ];

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
