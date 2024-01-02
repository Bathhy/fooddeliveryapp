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
        Get.to(profil_acc_bank());
      },
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 197,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Container(
              width: 91,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(imageperson)),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 120),
                child: Text(
                  'Joji',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 120),
                child: Text(
                  'Thomas@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 120),
                child: Text(
                  '+855 168169',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 120),
                child: Container(
                  width: 160,
                  child: Text(
                    'Sangkat Sras Chork khan duan penh Phnom Penh',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
