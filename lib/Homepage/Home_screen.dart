import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/listview_card.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile/profile_acc.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/bottom_navi_controller.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:fodddelieveryapp/controller/home_controller.dart';
import 'package:fodddelieveryapp/detailpage/cart_order.dart';
import 'package:fodddelieveryapp/search/search_food.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/Homepage/tab_bar.dart';
import 'package:fodddelieveryapp/component/custom_seemorebutton.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  final List<String> categorys = ["Food", "Drink", "Snacks", "Sauces"];
  late TabController _tabController;

  final HomeController _homeController = Get.find();
  final BottomNaviController botcontroller = Get.find();
  final DetailController _cartController = Get.find();
  @override
  void initState() {
    _tabController = TabController(length: categorys.length, vsync: this);
    _tabController.addListener(() {
      _homeController.filterByCategory(categorys[_tabController.index]);
    });

    Future.microtask(() => _homeController.filterByCategory(categorys.first));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        backgroundColor: colorGrey,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => CartOrder());
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 0,
                    bottom: 20,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: colorOrange,
                      child: Center(
                        child: Obx(
                          () => Text(
                            _cartController.cartCount.value.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawerclass(),
      body: Column(
        children: [
          Topofhome(),
          Mytabbar(
            categorys: categorys,
            tabController: _tabController,
          ),
          Align(alignment: Alignment.centerRight, child: Seemorebutton()),
          SizedBox(height: 10),
          Expanded(
            child: Mybuildcard(
              foodlist: _homeController.foodList,
            ),
          ),
        ],
      ),
    );
  }
}

class Drawerclass extends StatelessWidget {
  const Drawerclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorOrange,
      child: ListView(
        children: [
          SizedBox(height: 150),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.account_circle_outlined),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(() => Myprofile());
            },
          ),
          Divider(color: Colors.white, indent: 60.0, endIndent: 58.0),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.add_shopping_cart),
            title: const Text(
              'Orders',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(() => CartOrder());
            },
          ),
          Divider(color: Colors.white, indent: 60.0, endIndent: 58.0),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.sell_outlined),
            title: const Text(
              'Offer and Promo',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(color: Colors.white, indent: 60.0, endIndent: 58.0),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.sticky_note_2_outlined),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(color: Colors.white, indent: 60.0, endIndent: 58.0),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.security_outlined),
            title: const Text(
              'Security',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          SizedBox(height: 100),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            ),
            label: Text(
              'Sing-Out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Topofhome extends StatelessWidget {
  const Topofhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Delicious',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('food for you',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34)),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(() => SearchPage());
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 20),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
