import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/detailpage/detail_information.dart';
import 'package:get/get.dart';

class Seemorepage extends StatefulWidget {
  Seemorepage({super.key});

  @override
  State<Seemorepage> createState() => _SeemorepageState();
}

class _SeemorepageState extends State<Seemorepage> {
  @override
  List<Food> _dataList = [];

  void search(String title) {
    final tmpList =
        Food.foodlist.where((element) => element.name.contains(title));
    setState(() {
      _dataList = tmpList.toList();
    });
  }

  @override
  void initState() {
    search("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
          backgroundColor: colorGrey,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
            "See More Page",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _Gridview_card()),
          ],
        ),
      ),
    );
  }

  Widget _Gridview_card() {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8),
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          final item = _dataList[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailfoodInfo(
                    food: item,
                  ));
            },
            child: Container(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return Container(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 20,
                          child: Card(
                            elevation: 4,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
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
                                      item.img,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: Text(
                                      '\$ ${item.price}',
                                      style: TextStyle(
                                          color: colorOrange,
                                          fontSize: 15,
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
            ),
          );
        });
  }
}
