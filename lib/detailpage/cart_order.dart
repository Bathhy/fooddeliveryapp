import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
// import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:get/get.dart';

class CartOrder extends StatelessWidget {
  const CartOrder({
    Key? key,
  });
  // final List<Food> foodlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        backgroundColor: colorGrey,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      // body: ListView.separated(
      //     scrollDirection: Axis.vertical,
      //     itemCount: foodlist.length,
      //     separatorBuilder: (context, index) => SizedBox(height: 20),
      //     itemBuilder: (context, index) {}
      //     // children: [
      //     //   Container(
      //     //     decoration: BoxDecoration(
      //     //       borderRadius: BorderRadius.circular(40),
      //     //       color: Colors.white,
      //     //     ),
      //     //     padding: EdgeInsets.symmetric(vertical: 60),
      //     //   ),
      //     //   SizedBox(
      //     //     height: 20,
      //     //   ),
      //     //   CustomButton(title: 'Complete Order', callback: () {})
      //     // ],
      //     ),
      bottomSheet: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomButton(title: 'Complete Order', callback: () {})),
    );
  }
}
