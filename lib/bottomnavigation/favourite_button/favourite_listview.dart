import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/add_fav_controller.dart';
import 'package:get/get.dart';

class favListview extends StatefulWidget {
  favListview({
    super.key,
  });

  @override
  State<favListview> createState() => _favListviewState();
}

class _favListviewState extends State<favListview> {
  final AddFavouriteController _favcontrol = Get.find();
  void initState() {
    _favcontrol.getAllFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _favcontrol.favouritefood.length,
        itemBuilder: (context, index) {
          final foodfav = _favcontrol.favouritefood[index];
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Slidable(
              endActionPane: ActionPane(
                motion: BehindMotion(),
                extentRatio: 0.3,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _favcontrol.deleteByIndex(foodfav);
                    },
                    backgroundColor: Colors.grey.shade300,
                    icon: Icons.delete,
                    foregroundColor: Colors.red.shade700,
                    spacing: 10,
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
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$ ${foodfav.price}',
                              style: TextStyle(
                                  color: colorOrange,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              ),
            ),
          );
        },
      ),
    );
  }
}
