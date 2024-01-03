import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.color = colorOrange,
    this.textColor = Colors.white,
    required this.callback,
  });

  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              backgroundColor: color, minimumSize: Size.fromHeight(50)),
          child: Text(
            title,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
