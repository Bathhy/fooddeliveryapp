import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';

class Seemorebutton extends StatelessWidget {
  const Seemorebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text(
          'See more',
          style: TextStyle(
            color: colorOrange,
            fontSize: 20,
          ),
        ));
  }
}
