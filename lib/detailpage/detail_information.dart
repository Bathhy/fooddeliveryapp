import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';

class DetailfoodInfo extends StatefulWidget {
  const DetailfoodInfo({Key? key});

  @override
  State<DetailfoodInfo> createState() => _DetailfoodInfoState();
}

class _DetailfoodInfoState extends State<DetailfoodInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        children: [
          DescriptionDetailpage(foodlist: Food.foodlist),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(title: 'Add to card', callback: () {}),
          ),
        ],
      ),
    );
  }
}

class DescriptionDetailpage extends StatelessWidget {
  const DescriptionDetailpage({Key? key, required this.foodlist});
  final List<Food> foodlist;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            itemCount: foodlist.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: colorOrange,
                    child: Image.asset(
                      foodlist[index].img,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            Food.foodlist[0].name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: Text(
            Food.foodlist[0].price,
            style: TextStyle(
              color: colorOrange,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Delivery Info",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Delivered between monday aug and thursday 20 from 8pm to 91:32 pm",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Return Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  maxLines: 4,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
