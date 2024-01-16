import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_detail.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_model.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Myhistory extends StatefulWidget {
  const Myhistory({super.key});
  @override
  State<Myhistory> createState() => _MyhistoryState();
}

class _MyhistoryState extends State<Myhistory> {
  HistoryController _controller = Get.find();

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
      body: _listviewCard(),
    );
  }

  Widget _listviewCard() {
    return InkWell(
      onTap: () {
        Get.to(() => HistoryOrdDetail());
      },
      child: ListView.builder(
        itemCount: _controller.orderHistory.length,
        itemBuilder: (context, index) {
          HistoryModel historyModel = _controller.orderHistory[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      // historyModel.items.first.img,
                      imageperson,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'TotalAmount: ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Total: \$${historyModel.totalAmount}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            ),
          );
        },
      ),
    );
  }
}
