import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profileacc_bank.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Profilecard extends StatelessWidget {
  const Profilecard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => profil_acc_bank());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(imageperson)),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Joji',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Thomas@gmail.com',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    '+855 168169',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    'Sangkat Sras Chork \nkhan duan \n penh Phnom Penh',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
