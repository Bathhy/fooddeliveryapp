import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/controller/profile_controller.dart';
import 'package:get/get.dart';

enum PayMethod { Card, BankAccount, Paypal }

class BankPayment extends StatelessWidget {
  BankPayment({super.key});

  // pay? _paymentmeth= pay.Card;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRadioButton(
                  controller,
                  "Card",
                  PayMethod.Card,
                  Colors.orange,
                  Icon(
                    Icons.credit_card,
                    color: Colors.white,
                  )),
              _buildRadioButton(
                  controller,
                  "Bank Account",
                  PayMethod.BankAccount,
                  Colors.pink,
                  Icon(
                    Icons.account_balance,
                    color: Colors.white,
                  )),
              _buildRadioButton(
                  controller,
                  "PayPal",
                  PayMethod.Paypal,
                  Colors.blue,
                  Icon(
                    Icons.paypal,
                    color: Colors.white,
                  )),
            ],
          ),
        );
      },
    );
  }

  RadioListTile<PayMethod> _buildRadioButton(ProfileController controller,
      String title, PayMethod value, Color colorcont, Icon iconpayment) {
    return RadioListTile<PayMethod>(
      title: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorcont,
            ),
            child: iconpayment,
          ),
          SizedBox(width: 10),
          Text(title)
        ],
      ),
      value: value,
      groupValue: controller.payment,
      onChanged: (payment) {
        controller.updatPayment(payment);
      },
    );
  }
}
