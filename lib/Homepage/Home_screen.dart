import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/Homepage/listview_card.dart';
import 'package:fodddelieveryapp/Homepage/order_page.dart';
import 'package:fodddelieveryapp/bottomnavigation/profile_button/profile_acc.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/controller/home_controller.dart';
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

  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    _tabController = TabController(length: categorys.length, vsync: this);
    _tabController.addListener(() {
      _homeController.filterByCategory(categorys[_tabController.index]);
    });
    _homeController.filterByCategory(categorys.first);
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
            child: IconButton(
              onPressed: () {
                Get.to(Myorder());
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawerclass(),
      bottomNavigationBar: MyBottomNavigation(),
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
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.account_circle_outlined),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(Myprofile());
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.add_shopping_cart),
            title: const Text(
              'Orders',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Get.to(Myorder());
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.sell_outlined),
            title: const Text(
              'Offer and Promo',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.sticky_note_2_outlined),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.shield_outlined),
            title: const Text(
              'Security',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text('Delicious',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 34)),
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[400],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
                prefixIcon: const SizedBox(
                  width: 18,
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
