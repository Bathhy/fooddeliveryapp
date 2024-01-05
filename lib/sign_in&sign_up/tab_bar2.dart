import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:fodddelieveryapp/sign_in&sign_up/sign_out.dart';

class Mytabbarsignin extends StatelessWidget {
  const Mytabbarsignin({super.key});

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
                    Text('Login'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Sign-up'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
