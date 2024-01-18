import 'package:fodddelieveryapp/bottomnavigation/History_button/history_model.dart';

import 'package:get/get.dart';


class HistoryController extends GetxController{

  List<HistoryModel> orderHistory = [];

  void addToHistory(HistoryModel historyModel) {
    orderHistory.add(historyModel);
    update();
  }
  

}