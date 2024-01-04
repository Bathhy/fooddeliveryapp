import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/detailpage/listview_cart.dart';
// import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:get/get.dart';

class CartOrder extends StatefulWidget {
  const CartOrder({
    Key? key,
  });

  @override
  State<CartOrder> createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  // final List<Food> foodlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _MyCartAppbar(),
      body: Column(
        children: [
          Expanded(
            child: CartListview(
              foodlist: Food.foodlist,
            ),
          )
        ],
      ),
      bottomSheet: _customButton(),
    );
  }

  AppBar _MyCartAppbar() {
    return AppBar(
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
    );
  }

  Container _customButton() {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: CustomButton(title: 'Complete Order', callback: () {}));
  }
}
