import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_listview.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_model.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:get/get.dart';

class HistoryOrdDetail extends StatelessWidget {
  final HistoryModel historyModel;
  HistoryOrdDetail({super.key, required this.historyModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _appbarHistory(),
      bottomNavigationBar: _Totalamount(),
      body: Column(
        children: [
          Expanded(child: HistoryOrderView(historyModel: historyModel)),
        ],
      ),
      // bottomSheet: _Totalamount(),
    );
  }

  Widget _Totalamount() {
    final DetailController _controller = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(color: colorOrange),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Total:  ${_controller.totalAmount}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorGrey,
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appbarHistory() => AppBar(
        backgroundColor: colorGrey,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      );
}
