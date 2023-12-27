import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/Home_screen.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile_button/profile_card.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/component/custom_buttonprofile.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(Homescreen());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    imageMP,
                    height: 34,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Personal Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(color: colorOrange, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Profilecard(),
              SizedBox(height: 20),
              CustomButtonprofile(
                title: 'Orders',
                callback: () {},
                icon: Icon(Icons.arrow_forward_ios),
                textColor: Colors.black,
              ),
              SizedBox(height: 20),
              CustomButtonprofile(
                title: 'Pending reviews',
                callback: () {},
                icon: Icon(Icons.arrow_forward_ios),
                textColor: Colors.black,
              ),
              SizedBox(height: 20),
              CustomButtonprofile(
                title: 'Faq',
                callback: () {},
                icon: Icon(Icons.arrow_forward_ios),
                textColor: Colors.black,
              ),
              SizedBox(height: 20),
              CustomButtonprofile(
                title: 'Help',
                callback: () {},
                icon: Icon(Icons.arrow_forward_ios),
                textColor: Colors.black,
              ),
              SizedBox(height: 10),
              CustomButton(title: 'Update', callback: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
