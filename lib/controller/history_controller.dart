import 'package:fodddelieveryapp/bottomnavigation/History_page/history_model.dart';

import 'package:get/get.dart';


class HistoryController extends GetxController{

  // List<HistoryModel> orderHistory = [];
  final foodhist = <HistoryModel>[].obs;

  void addToHistory(HistoryModel historyModel) {
    foodhist.add(historyModel);
    update();
  }
  

} 