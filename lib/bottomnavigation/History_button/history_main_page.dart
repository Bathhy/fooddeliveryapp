import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/Home_screen.dart';
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
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.to(Homescreen());
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
    );
  }
}
