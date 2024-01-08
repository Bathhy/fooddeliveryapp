import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/payment_selection.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profile_card_two.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:get/get.dart';

class profil_acc_bank extends StatelessWidget {
  const profil_acc_bank({super.key});

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
        title: Text(
          'My Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Information',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
              Profilecard_two(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 10),
              BankPayment(),
              SizedBox(height: 200),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomButton(title: 'Update', callback: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
