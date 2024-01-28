import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Driverpage extends StatefulWidget {
  const Driverpage({super.key});

  @override
  State<Driverpage> createState() => _DriverpageState();
}

class _DriverpageState extends State<Driverpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        backgroundColor: colorGrey,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [Expanded(child: Image.asset(imagedriver))],
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            "Your Driver is on the way",
            style: TextStyle(
              color: colorOrange,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Estimate Time is: 30Minutes",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CustomButton(
                  title: "Finish Order",
                  callback: () {
                    Get.offAll(() => MyBottomNavigation());
                  }),
            ),
          )
        ],
      ),
    );
  }
}
