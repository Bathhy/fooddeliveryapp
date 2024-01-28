import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/add_fav_controller.dart';
import 'package:fodddelieveryapp/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartListview extends StatefulWidget {
  CartListview({super.key});
  @override
  State<CartListview> createState() => _CartListviewState();
}

class _CartListviewState extends State<CartListview> {
  final AddtoCartController _addcontrol = Get.find();
  final AddFavouriteController _favcontrol = Get.find();

  @override
  void initState() {
    _addcontrol.getAllFood();
    _addcontrol.totalQTY();
    super.initState();
  }

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddtoCartController>(builder: (controller) {
      return ListView.builder(
        itemCount: _addcontrol.foodList.length,
        itemBuilder: (context, index) {
          final food = _addcontrol.foodList[index];
          print(food.img);
          return Container(
            margin: EdgeInsets.only(top: 5),
            child: Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.5,
                motion: BehindMotion(),
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _favcontrol.saveFavData(food);
                    },
                    backgroundColor: Colors.grey.shade300,
                    icon: Icons.favorite_border,
                    foregroundColor: Colors.green,
                    spacing: 12,
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _addcontrol.removeOne(food);
                    },
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.red.shade700,
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
                            fontSize: 19,
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
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
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
                                        // decrease cart count
                                        controller.decreateQty(index);
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    //output number count

                                    "${food.qty}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  //add product increment
                                  IconButton(
                                      onPressed: () {
                                        //increase cart count
                                        controller.increateQty(index);
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
}
