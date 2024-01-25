import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/pay_ment.dart/driver_page.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/cart_controller.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';

import 'package:get/get.dart';

class HistoryController extends GetxController {
  final productStorage _historyStorage = productStorage.instance;

  final foodhist = <HistoryModel>[].obs;

  void addToHistory(HistoryModel historyModel) {
    foodhist.add(historyModel);
    update();
  }

  void getAllHistory() async {
    final foodGethistory = await _historyStorage.getHistory();
    foodhist(foodGethistory);
  }

  void completeOrder(List<Food> foods) async {
    String orderDate = DateTime.now().toString();
    int qty = foods.length;
    double totalAmount = 0.0;

    foods.forEach((element) {
      totalAmount += double.parse(element.price) * element.qty;
    });

    HistoryModel historyModel = HistoryModel(
        orderDate: orderDate,
        totalAmount: totalAmount,
        qty: qty,
        items: List.from(foods));

    await _historyStorage.setDataHistory(historyModel);
    Get.find<AddtoCartController>().remvoeAll();
    getAllHistory();
    // W
    Get.to(() => Driverpage());
  }
}
