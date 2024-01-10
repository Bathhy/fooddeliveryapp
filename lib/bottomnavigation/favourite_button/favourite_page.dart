import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:fodddelieveryapp/detailpage/listview_cart.dart';
import 'package:get/get.dart';

class Myfavourite extends StatefulWidget {
  const Myfavourite({super.key});

  @override
  State<Myfavourite> createState() => _MyfavouriteState();
}

class _MyfavouriteState extends State<Myfavourite> {
  final DetailController _favcontr = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Favourite',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: colorGrey,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CartListview(
                  
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
