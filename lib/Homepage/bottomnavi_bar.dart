import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/home_controller.dart';
import 'package:get/get.dart';

class MyBottomNavigation extends StatefulWidget {
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  final HomeController homeController = Get.find();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: homeController.currentIndex.value,
        onTap: (index) {
          homeController.switchpage(index);
        },
        backgroundColor: colorGrey,
        selectedItemColor: colorOrange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 31,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline_outlined,
              size: 31,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 31,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 31,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
