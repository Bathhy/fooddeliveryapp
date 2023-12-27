import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/Homepage/listview_card.dart';
import 'package:fodddelieveryapp/Homepage/order_page.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/Homepage/tab_bar.dart';
import 'package:fodddelieveryapp/component/custom_seemorebutton.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        children: const [
          Topofhome(),
          Mytabbar(),
          Align(alignment: Alignment.centerRight, child: Seemorebutton()),
          SizedBox(height: 10),
          Expanded(child: Mybuildcard()),
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
      child: Column(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(249, 254, 42, 5),
                ),
                child: Text('Drawer head'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
              ),
            ],
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
                fillColor: Color.fromARGB(255, 234, 216, 216),
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
