import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/detailpage/detail_information.dart';

class Mybuildcard extends StatelessWidget {
  const Mybuildcard({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: foodlist.length,
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemBuilder: (context, index) {
        InkWell(
          onTap: () {
            Get.to(DetailfoodInfo());
          },
        );
        Food food = foodlist[index];
        return Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 290,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: colorOrange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Positioned(
                      top: 120,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      food.name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
