import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/seemore_page.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get/get.dart';

class Seemorebutton extends StatelessWidget {
  const Seemorebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.to(() => Seemorepage());
        },
        child: const Text(
          'See more',
          style: TextStyle(
            color: colorOrange,
            fontSize: 20,
          ),
        ));
  }
}
