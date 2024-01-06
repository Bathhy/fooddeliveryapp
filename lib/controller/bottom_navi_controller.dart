// import 'package:fodddelieveryapp/Homepage/Home_screen.dart';
// import 'package:fodddelieveryapp/bottomnavigation/History_button/history_main_page.dart';
// import 'package:fodddelieveryapp/bottomnavigation/favourite_button/favourite_page.dart';
// import 'package:fodddelieveryapp/bottomnavigation/profile/profile_acc.dart';
// import 'package:get/get.dart';

// class BottomNaviController extends GetxController {
//   final currentIndex = 0.obs;
//   final Screen = [
//     Homescreen(),
//     Myfavourite(),
//     Myprofile(),
//     Myhistory(),
//   ];

//   void pageclick(int index) {
//     currentIndex.value = index;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:fodddelieveryapp/component/constant_color.dart';
// import 'package:fodddelieveryapp/controller/bottom_navi_controller.dart';
// import 'package:get/get.dart';

// class MyBottomNavigation extends StatelessWidget {
//   final BottomNaviController _bottomcontroller =
//       Get.put(BottomNaviController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//           () => _bottomcontroller.Screen[_bottomcontroller.currentIndex.value]),
//       bottomNavigationBar: Obx(
//         () => BottomNavigationBar(
//           backgroundColor: Color(0xfff2f2f2),
//           elevation: 0,
//           currentIndex: _bottomcontroller.currentIndex.value,
//           onTap: (index) {
//             _bottomcontroller.pageclick(index);
//           },
//           selectedItemColor: colorOrange,
//           unselectedItemColor: Colors.grey,
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 size: 30,
//               ),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.favorite_border,
//                 size: 30,
//               ),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.person,
//                 size: 30,
//               ),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.history,
//                 size: 30,
//               ),
//               label: "",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

