import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/sign_in&sign_up/login_page.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(249, 254, 42, 5),
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 60),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(imageChef),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 35),
                  child: Image.asset(
                    imageFFE,
                    height: 90,
                  ),
                )
              ],
            ),
            Positioned(
              top: 350,
              right: 0,
              child: Image.asset(
                imageBoy,
                height: 330,
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              child: Image.asset(
                imagegirl,
                height: 400,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 400,
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorOrange,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  callback: () {
                    Get.to(() => MyLoginPage());
                  },
                  title: "Get Started",
                  color: Colors.white,
                  textColor: colorOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
