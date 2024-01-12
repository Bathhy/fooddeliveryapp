import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  List<Food> foodcart = [];

  List<Food> selectedFoods = [];
  List<Food> favoriteFoods = [];

  RxBool isIconColored = false.obs;
  var cartCount = 0.obs;
  var totalprice = 0.obs;
  RxString totalAmount = ''.obs;
  void addToFav(Food food) {
    // Check if the food is not already in favorites
    if (!favoriteFoods.contains(food)) {
      favoriteFoods.add(food);

      update();
      Get.snackbar("Success", "Add to favourite Successfully",
          backgroundColor: colorOrange, colorText: colorGrey);
    }
    changeColor();
  }

  void removeFromFav(Food food) {
    favoriteFoods.remove(food);
    update();
  }

  void removeFromCart(Food food) {
    foodcart.remove(food);
    cartCount--;
    calculateAmount(food);
    calculateAmount(food);
    update();
  }

  void addToCart(Food food) {
    foodcart.add(food);
    cartCount++;
    Get.snackbar("Success", "Add to Cart Successfully",
        backgroundColor: colorOrange, colorText: colorGrey);
    calculateAmount(food);
    update();
  }

  void CartEmpty(Food food) {
    foodcart.clear();
    update();
  }

  void favEmpty(Food food) {
    favoriteFoods.clear();
    update();
  }

  void calculateAmount(Food food) {
    int total = 0;

    for (var food in foodcart) {
      int price = int.tryParse(food.price.replaceAll('\$', '')) ?? 0;
      total += price;
    }

    totalprice.value = total;
    totalAmount.value = '\$$total';
  }

  void changeColor() {
    isIconColored.value = !isIconColored.value;
  }
}
