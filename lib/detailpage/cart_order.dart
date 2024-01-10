import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:fodddelieveryapp/detailpage/listview_cart.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class CartOrder extends StatefulWidget {
  const CartOrder({
    Key? key,
  });

  @override
  State<CartOrder> createState() => _CartOrderState();
}

class _CartOrderState extends State<CartOrder> {
  final DetailController _cartcontrol = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _MyCartAppbar(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 90),
              child: Image.asset(imageswipe)),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: _buildCartContent(),
            ),
          ),
          _customButton(),
        ],
      ),
    );
  }

  Widget _buildCartContent() {
    if (_cartcontrol.foodcart.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 150,
              color: Colors.grey[400],
            ),
            Text(
              'No orders yet',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              'Hit the orange button down \n below to Create an order',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CartListview(),
      );
    }
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
        child: CustomButton(title: 'start Ordering', callback: () {}));
  }
}
