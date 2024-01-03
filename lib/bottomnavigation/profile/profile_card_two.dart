import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';

class Profilecard_two extends StatelessWidget {
  const Profilecard_two({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(imageperson)),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Joji',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'Thomas@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Sangkat Sras Chork khan duan',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
