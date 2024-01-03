import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/favourite_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profile_acc.dart';
import 'package:get/get.dart';

import '../component/custom_listview.dart';

class HomeController extends GetxController {
  List<Food> allList = [];
  final currentIndex = 0.obs;

  final foodList = <Food>[].obs;

  @override
  void onInit() {
    allList = Food.foodlist;
    super.onInit();
  }

  void filterByCategory(String catName) {
    final filterList = allList.where((food) => food.category == catName);
    foodList(filterList.toList());
  }

  void switchpage(int index) {
    currentIndex.value = index;
    switch (index) {
      case 1:
        Get.to(() => Myfavourite());
        break;
      case 2:
        Get.to(() => Myprofile());
        break;
      case 3:
        Get.to(() => Myhistory());
        break;
    }
  }

  
}
