import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Myhistory extends StatefulWidget {
  const Myhistory({super.key});

  @override
  State<Myhistory> createState() => _MyhistoryState();
}

class _MyhistoryState extends State<Myhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'History',
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                      width: 100,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(imageperson)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
