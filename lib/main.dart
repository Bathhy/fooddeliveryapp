import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/detailpage/detail_information.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: colorOrange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const DetailfoodInfo(),
    );
  }
}
