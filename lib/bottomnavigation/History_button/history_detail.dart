import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get/get.dart';

class HistoryOrdDetail extends StatelessWidget {
  const HistoryOrdDetail({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorGrey,
        appBar: _appbarHistory(),
        body: _historyOrderDetail());
  }

  Widget _historyOrderDetail() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.red),
            ),
          );
        });
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
