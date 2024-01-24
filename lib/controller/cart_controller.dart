import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/pay_ment.dart/pay_check.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';
import 'package:get/get.dart';

class AddtoCartController extends GetxController {
  RxList<Food> foodcart = <Food>[].obs;
  // final productStorage _favstorage = productStorage.instance;

  final foodList = <Food>[].obs;
  var totalqty = 0.obs;
  var cartCount = 0.obs;
  var totalprice = 0.obs;

  productStorage _productStorage = productStorage.instance;

  final productStorage _storage = productStorage.instance;

  void addTocart(Food foodrepo) async {
    final isSave = await _productStorage.setData(foodrepo);

    if (isSave) {
      Get.find<AddtoCartController>().totalQTY();
      Get.snackbar("Success", "Add to Cart Successfully",
          backgroundColor: colorOrange,
          colorText: colorGrey,
          duration: Duration(seconds: 1));

      totalqty++;
    }
  }

  void getAllFood() async {
    final foods = await _storage.getFoodRepo();
    foodList(foods);
    update();
  }

  void remvoeAll() {
    _storage.removeByKey("CatList");
    foodList.clear();
    totalQTY();
  }

  void removeOne(Food foodRepo) async {
    final isRemvoe = await _storage.removeFood(foodRepo);
    if (isRemvoe) {
      getAllFood();
      totalQTY();
    }
  }

  void totalQTY() async {
    final allItems = await _storage.getFoodRepo();
    print("===== ${allItems.length}");
    totalqty.value = allItems.length;
  }

  void increateQty(int index) {
    foodList[index].qty += 1;
    update();
  }

  void decreateQty(int index) {
    if (foodList[index].qty <= 1) {
      return;
    }

    foodList[index].qty -= 1;
    update();
  }

  void checkcartEmpty() {
    if (foodList.isEmpty) {
      Get.snackbar("No Items", "Please Add food to Cart",
          backgroundColor: Colors.red[900],
          colorText: colorGrey,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1));
    } else {
      Get.to(() => Mypaymentpage());
    }
  }



  // void completeOrder() {
  //   String orderDate = DateTime.now().toString();
  //   int qty = foodList.length;
  //   double totalAmount = 0.0;

  //   foodList.forEach((element) {
  //     totalAmount += double.parse(element.price) * element.qty;
  //   });

  //   HistoryModel historyModel = HistoryModel(
  //       orderDate: orderDate,
  //       totalAmount: totalAmount,
  //       qty: qty,
  //       items: List.from(foodList));

  //   Get.find<HistoryController>().addToHistory(historyModel);

  //   Get.offAll(() => MyBottomNavigation());
  //   clearcart();
  // }

  // void clearcart() {
  //   foodList.clear();
  //   totalqty.value = 0;
  //   // totalprice.value = 0;
  //   // totalAmount.value = '';
  //   update();
  // }

  double countPreTotal() {
    double total = 0.0;
    foodList.forEach((element) {
      total += (double.parse(element.price)) * element.qty;
    });
    return total;
  }
}
