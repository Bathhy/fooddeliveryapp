import 'package:flutter/material.dart';

class Mytabbar extends StatelessWidget {
  const Mytabbar(
      {super.key, required this.categorys, required this.tabController});

  final List<String> categorys;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        tabs: categorys.map((category) {
          return Tab(text: category);
        }).toList());
  }
}
