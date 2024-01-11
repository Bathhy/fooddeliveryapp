import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  List<Food> foodcart = [];

  List<Food> favoriteFoods = [];

  RxBool isIconColored = false.obs;

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
    Get.snackbar("Success", "Add to Cart Successfully",
        backgroundColor: colorOrange, colorText: colorGrey);
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

  // void changecolor(){
  //   if(iconColorIndex.value == Colors.grey){
  //     iconColorIndex.value= 1;
  //   }
  //   else{
  //     iconColorIndex.value = 0;
  //   }
  // }
  void changeColor() {
    isIconColored.value = !isIconColored.value;
  }
}
