import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month,
              size: 200,
              color: Colors.grey[400],
            ),
            Text(
              'No history  yet',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Hit the orange button down \n below to Create an order',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
