import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:get/get.dart';
class FavouriteController extends GetxController{
  final RxList<Food> cartItems = <Food>[].obs;
  void addToCart(Food food) {
    // Custom logic to check if the item is already in the cart
    bool isInCart = cartItems.any((item) => item.name == food.name);

    if (!isInCart) {
      cartItems.add(food);
      Get.snackbar('Added to Cart', 'Item added to your cart');
    } else {
      Get.snackbar('Already in Cart', 'Item is already in your cart');
    }
  }
}