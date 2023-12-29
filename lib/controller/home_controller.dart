import 'package:get/get.dart';

import '../component/custom_listview.dart';

class HomeController extends GetxController {
  List<Food> allList = [];

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
}
