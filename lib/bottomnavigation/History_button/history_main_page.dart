import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_detail.dart';
import 'package:fodddelieveryapp/bottomnavigation/History_button/history_model.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class Myhistory extends StatefulWidget {
  const Myhistory({super.key});
  // final HistoryModel historyModel;
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
            // Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: _BuildHistoryempty(),
          ))
        ],
      ),
    );
  }

  Widget _BuildHistoryempty() {
    if (_controller.orderHistory.isEmpty) {
      return Center(
        child: _BuildnoHistory(),
      );
    } else {
      return Container(
        child: _listviewCard(),
      );
    }
  }

  Widget _BuildnoHistory() {
    return Column(
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          size: 150,
          color: Colors.grey[400],
        ),
        Text(
          'No History yet',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          'Please Order Something \n to show',
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
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
            child: Stack(children: [
              Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        // historyModel.items.first.img,
                        imageperson,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DateTime : ${historyModel.orderDate} ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Total Amount: ${historyModel.totalAmount}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Quantity: ${historyModel.qty}")
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              ),
            ]),
          );
        },
      ),
    );
  }
}
