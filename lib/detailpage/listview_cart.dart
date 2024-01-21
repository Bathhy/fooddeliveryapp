import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/cart_controller.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:get/get.dart';

class CartListview extends StatefulWidget {
  CartListview({
    super.key
  });
  @override
  State<CartListview> createState() => _CartListviewState();
}

class _CartListviewState extends State<CartListview> {
  final DetailController _controller = Get.find();
  final AddtoCartController _addcontrol = Get.find();

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(builder: (controller) {
      return ListView.builder(
        itemCount: _controller.foodcart.length,
        itemBuilder: (context, index) {
          final food = _controller.foodcart[index];
          return Container(
            margin: EdgeInsets.only(top: 5),
            child: Slidable(
              endActionPane: ActionPane(
                // extentRatio: 0.5,
                motion: BehindMotion(),
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _controller.addTocart(food);
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.favorite_outline,
                    spacing: 12,
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _addcontrol.removeOne(food);
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
                            food.img,
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
                          food.name,
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
                              '\$ ${food.price}',
                              style: TextStyle(
                                  color: colorOrange,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            //Box increment and decrement
                            Container(
                              decoration: BoxDecoration(
                                color: colorOrange,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //decrement product
                                  IconButton(
                                      onPressed: () {
                                        // _controller.cartCount;
                                        dcreament();
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      //output number count
                                      // " ${_controller.cartCount}",
                                      "${count}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //add product increment
                                  IconButton(
                                      onPressed: () {
                                        increament();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))
                                ],
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
    });
  }

  void increament() {
    setState(() {
      count++;
    });
  }

  void dcreament() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }
}
