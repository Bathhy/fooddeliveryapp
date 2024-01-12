import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:get/get.dart';

class favListview extends StatelessWidget {
  favListview({
    super.key,
  });

  final DetailController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _controller.favoriteFoods.length,
      itemBuilder: (context, index) {
        final foodfav = _controller.favoriteFoods[index];
        return Container(
          margin: EdgeInsets.only(top: 5),
          child: Slidable(
            endActionPane: ActionPane(
              // extentRatio: 0.5,
              motion: BehindMotion(),
              children: [
                SizedBox(
                  width: 70,
                ),
                SlidableAction(
                  onPressed: (context) {
                    _controller.removeFromFav(foodfav);
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  spacing: 12,
                  autoClose: true,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          foodfav.img,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodfav.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            foodfav.price,
                            style: TextStyle(
                                color: colorOrange,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: colorOrange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            ),
          ),
        );
      },
    );
  }
}
