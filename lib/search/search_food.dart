import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/detailpage/detail_information.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Food> _dataList = [];

  void search(String title) {
    final tmpList = Food.foodlist.where(
        (element) => element.name.toLowerCase().contains(title.toLowerCase()));
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
              FocusScope.of(context).unfocus();
              Future.delayed(Duration(milliseconds: 250), () {
                Get.back();
              });
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: TextField(
          onChanged: (String value) {
            search(value);
          },
          style: TextStyle(fontWeight: FontWeight.bold),
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            iconColor: Colors.black,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search_outlined),
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
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
    return _dataList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 150,
                  color: Colors.grey[400],
                ),
                Text(
                  'Search not Found',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Try searching the item with \n a different keyword.',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          )
        : GridView.builder(
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
                                              fontSize: 16,
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
