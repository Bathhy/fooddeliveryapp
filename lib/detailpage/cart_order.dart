import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';

import 'package:fodddelieveryapp/controller/cart_controller.dart';
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
  final AddtoCartController _addcontrol = Get.find();
 
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: _MyCartAppbar(),
      body: GetBuilder<AddtoCartController>(
        init: _addcontrol,
        builder: (controller) {
          return Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Image.asset(imageswipe)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CartListview(),
                  // child: _buildNoItems(),
                  // child: _addcontrol.foodList.isEmpty
                  //     ? CartListview()
                  //     : _buildNoItems(),
                ),
              ),
              _customButton(),
            ],
          );
        },
      ),
    );
  }

  // Widget _buildNoItems() {
  //   return Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(
  //           Icons.favorite_outline_rounded,
  //           size: 150,
  //           color: Colors.grey[400],
  //         ),
  //         Text(
  //           'No favourite foods yet',
  //           style: TextStyle(
  //               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
  //         ),
  //         Text(
  //           'Please add your favourite food here',
  //           style: TextStyle(
  //               color: Colors.black54,
  //               fontWeight: FontWeight.bold,
  //               fontSize: 15),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
        child: CustomButton(
            title: 'Start Ordering',
            callback: () {
              _addcontrol.checkcartEmpty();
            }));
  }
}
