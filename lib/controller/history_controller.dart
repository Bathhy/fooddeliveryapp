import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/cart_controller.dart';
import 'package:fodddelieveryapp/local_storage/local.dart';

import 'package:get/get.dart';

class HistoryController extends GetxController {
  final productStorage _historyStorage = productStorage.instance;
  // List<HistoryModel> orderHistory = [];
  final foodhist = <HistoryModel>[].obs;
  RxList<Food> foodcart = <Food>[].obs;
  void addToHistory(HistoryModel historyModel) {
    foodhist.add(historyModel);
    update();
  }
  void getAllHistory() async{
    final foodGethistory = await _historyStorage.getHistory();
    foodhist(foodGethistory);
  }
  void completeOrder(List<Food> foods) async{
    String orderDate = DateTime.now().toString();
    int qty = foodhist.length;
    double totalAmount = 0.0;

    foodcart.forEach((element) {
      totalAmount += double.parse(element.price);
    });

    HistoryModel historyModel = HistoryModel(
        orderDate: orderDate,
        totalAmount: totalAmount,
        qty: qty,
        items: List.from(foodcart));
    await _historyStorage.setDataHistory(historyModel);
    Get.find<AddtoCartController>().remvoeAll();
    getAllHistory();
    Get.offAll(() => MyBottomNavigation());

  }


}
