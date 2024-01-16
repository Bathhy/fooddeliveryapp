import 'package:fodddelieveryapp/Homepage/Home_screen.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/favourite_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profile_acc.dart';
import 'package:get/get.dart';

class BottomNaviController extends GetxController {
  var currentIndex = 0.obs;
  final Screen = [Homescreen(), Myfavourite(), Myprofile(), Myhistory()];

  void pageclick(int index) {
    currentIndex.value = index;
  }
}
