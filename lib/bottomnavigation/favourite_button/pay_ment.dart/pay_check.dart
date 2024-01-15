import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/payment_selection.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';

import 'package:get/get.dart';

class Mypaymentpage extends StatelessWidget {
  const Mypaymentpage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailController _numCountControl = Get.find();
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _AppBarPayment(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Please Selected Payment Method:",
                style: TextStyle(
                    color: colorOrange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BankPayment(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Quantity :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Obx(
                  () => Text(
                    _numCountControl.cartCount.value.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount :',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Obx(
                  () => Text(
                    ' \$${_numCountControl.totalprice}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    title: "Complete Order",
                    callback: () {
                      Get.to(() => Myhistory());
                    })),
          )
        ],
      ),
    );
  }

  AppBar _AppBarPayment() {
    return AppBar(
        centerTitle: true,
        backgroundColor: colorGrey,
        title: Text(
          'Payment',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)));
  }
}
