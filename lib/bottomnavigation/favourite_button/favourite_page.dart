import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get/get.dart';

class Myfavourite extends StatefulWidget {
  const Myfavourite({super.key});

  @override
  State<Myfavourite> createState() => _MyhistoryState();
}

enum Fruit { apple, banana }

class _MyhistoryState extends State<Myfavourite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorGrey,
        appBar: AppBar(
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
        // bottomNavigationBar: MyBottomNavigation(),
      ),
    );
  }
}
