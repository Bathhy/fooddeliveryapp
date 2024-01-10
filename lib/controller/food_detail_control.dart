import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  List<Food> foodcart = [];
  RxList<Food> favoriteFoods = <Food>[].obs;

  void addToFav(Food food) {
    // Check if the food is not already in favorites
    if (!favoriteFoods.contains(food)) {
      favoriteFoods.add(food);
    }
    Get.snackbar("Success", "Add Successfully",
        backgroundColor: colorOrange, colorText: colorGrey);
    update();
  }

  void removeFromFav(Food food) {
    // Remove the food from favorites
    favoriteFoods.remove(food);
    update();
  }

  void removeFromCart(Food food) {
    foodcart.remove(food);
    update();
  }

  void addToCart(Food food) {
    // Add the food to the cart (if needed)
    foodcart.add(food);
    Get.snackbar("Success", "Add Successfully",
        backgroundColor: colorOrange, colorText: colorGrey);
    update();
  }
}
