import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_listview.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
        title: TextField(
          onChanged: (String value) {
            search(value);
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              iconColor: Colors.black,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search_outlined)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Gridview_card()),
          ],
        ),
      ),
    );
  }

  GridView Gridview_card() {
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
          return Container(
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
                              borderRadius: BorderRadius.circular(30)),
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
                                    item.price,
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
          );
        });
  }
}
