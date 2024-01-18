import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_model.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/pay_ment.dart/pay_check.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  List<Food> foodcart = [];

  List<Food> selectedFoods = [];
  List<Food> favoriteFoods = [];

  RxBool isIconColored = false.obs;
  var cartCount = 0.obs;
  var totalprice = 0.obs;
  RxString totalAmount = ''.obs;

// cart controler
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

  void checkcartEmpty() {
    if (foodcart.isEmpty) {
      Get.snackbar(
        "No Items",
        "Please Add food to Cart",
        backgroundColor: Colors.red[900],
        colorText: colorGrey,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.to(() => Mypaymentpage());
    }
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

//fav controller

  void addToFav(Food food) {
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

  void favEmpty(Food food) {
    favoriteFoods.clear();
    update();
  }

  void changeColor() {
    isIconColored.value = !isIconColored.value;
  }

  void completeOrder() {
    String orderDate = DateTime.now().toString();
    int qty = foodcart.length;
    double totalAmount = 0.0;

    foodcart.forEach((element) {
      totalAmount += double.parse(element.price);
    });

    HistoryModel historyModel =
        HistoryModel(orderDate, totalAmount, qty, List.from(foodcart));

    Get.find<HistoryController>().addToHistory(historyModel);
    clearcart();
    Get.to(() => MyBottomNavigation());
  }

  void clearcart() {
    foodcart.clear();
    cartCount.value = 0;
    totalprice.value = 0;
    totalAmount.value = '';
    update();
  }
}
