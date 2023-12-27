import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/favourite_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile_button/profile_acc.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get/get.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({Key? key});
  final _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        switch (index) {
          case 1:
            Get.to(Myfavourite());
          case 2:
            Get.to(Myprofile());
          case 3:
            Get.to(Myhistory());
        }
      },
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
    );
  }
}
