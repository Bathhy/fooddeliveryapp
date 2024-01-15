import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/GetxBinding/Getx_Binding.dart';
import 'package:fodddelieveryapp/splashscreen/splashscreen.dart';
import 'package:get/get.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:get_storage/get_storage.dart';

void main()async{
  await GetStorage.init;
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: FoodBinding(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorOrange),
          useMaterial3: true,
          bottomNavigationBarTheme: BottomNavigationBarTheme.of(context)
              .copyWith(backgroundColor: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
