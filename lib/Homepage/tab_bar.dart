import 'package:flutter/material.dart';

class Mytabbar extends StatelessWidget {
  const Mytabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Food'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Drink'),
                  ],
                ),
              ),
            ],
          ),
          // TabBarView(children: [
          //   Mybuildcard(),
          //   Container(
          //     height: 50,
          //     width: 30,
          //     color: colorOrange,
          //   )
          // ])
        ],
      ),
    );
  }
}
