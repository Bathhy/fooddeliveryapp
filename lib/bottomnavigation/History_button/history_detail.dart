import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_listview.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:get/get.dart';

class HistoryOrdDetail extends StatelessWidget {
  const HistoryOrdDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _appbarHistory(),
      body: HistoryOrderView(),
      bottomSheet: _Totalamount(),
    );
  }

  Widget _Totalamount() {
    final DetailController _controller = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(color: colorOrange),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total:",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorGrey,
            ),
          ),
          Text("Date:"),
          Obx(
            () => Text(
              ' ${_controller.totalAmount}',
              style: TextStyle(
                  color: colorGrey, fontSize: 25, fontWeight: FontWeight.w700),
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
