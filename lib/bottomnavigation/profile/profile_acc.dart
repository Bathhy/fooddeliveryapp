import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profile_card.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/component/custom_buttonprofile.dart';
import 'package:fodddelieveryapp/controller/profile_controller.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  ProfileController _profileController = Get.put(ProfileController());

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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
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
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                CustomButtonprofile(
                  title: 'Pending reviews',
                  callback: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                CustomButtonprofile(
                  title: 'Faq',
                  callback: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                CustomButtonprofile(
                  title: 'Help',
                  callback: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                ),
                SizedBox(height: 50),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child:
                        CustomButton(title: 'Complete Order', callback: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
