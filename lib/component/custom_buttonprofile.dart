import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';

class CustomButtonprofile extends StatelessWidget {
  const CustomButtonprofile({
    super.key,
    required this.title,
    this.color = colorOrange,
    this.textColor = Colors.black,
    required this.callback,
    required this.icon,
  });

  final String title;
  final Color color;
  final Color textColor;
  final VoidCallback callback;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: 60,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: textColor),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
