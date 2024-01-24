import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';

class Mytabbar extends StatelessWidget {
  const Mytabbar(
      {super.key, required this.categorys, required this.tabController});

  final List<String> categorys;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        unselectedLabelColor: Colors.black,
        labelColor: colorOrange,
        indicatorColor: colorOrange,
        labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        tabs: categorys.map((category) {
          return Tab(text: category);
        }).toList());
  }
}
