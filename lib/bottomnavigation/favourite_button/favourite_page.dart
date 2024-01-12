import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/favourite_button/favourite_listview.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
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
            Container(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Image.asset(imageswipe)),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: _buildFavcontent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavcontent() {
    return GetBuilder(
        init: _favcontr,
        builder: (controller) {
          if (_favcontr.favoriteFoods.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_outline_rounded,
                    size: 150,
                    color: Colors.grey[400],
                  ),
                  Text(
                    'No favourite foods yet',
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
              child: favListview(),
            );
          }
        });
  }
}
