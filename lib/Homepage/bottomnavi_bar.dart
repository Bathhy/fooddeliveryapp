import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/bottom_navi_controller.dart';
import 'package:get/get.dart';

class MyBottomNavigation extends StatelessWidget {
  
  final BottomNaviController _bottomcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
          () => _bottomcontroller.Screen[_bottomcontroller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: colorGrey,
          currentIndex: _bottomcontroller.currentIndex.value,
          onTap: (index) {
            _bottomcontroller.pageclick(index);
          },
          selectedItemColor: colorOrange,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_outlined,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                size: 30,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
