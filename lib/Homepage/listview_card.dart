import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/detailpage/detail_information.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';

class Mybuildcard extends StatelessWidget {
  Mybuildcard({Key? key, required this.foodlist});
  final List<Food> foodlist;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        scrollDirection: Axis.horizontal,
        itemCount: foodlist.length,
        separatorBuilder: (context, index) => SizedBox(width: 20),
        itemBuilder: (context, index) {
          final Food food = foodlist[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailfoodInfo(food: food));
            },
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Container(
                  width: 220,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        top: 40,
                        child: Card(
                          elevation: 4,
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          color: Colors.white,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image.asset(
                                    food.img,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    food.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Text(
                                    '\$ ${food.price}',
                                    style: TextStyle(
                                        color: colorOrange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
