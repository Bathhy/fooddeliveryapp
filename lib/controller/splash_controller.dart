// import 'dart:async';

// import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
// import 'package:fodddelieveryapp/controller/auth_control.dart';
// import 'package:fodddelieveryapp/sign_in&sign_up/login_page.dart';
// import 'package:get/get.dart';

// class SplashController extends GetxController {
//   late Timer? _timer;

//   void intiSplashScreen() async {
//     Authcontroller authController = Get.find();

//     _timer = Timer(
//       Duration(seconds: 4),
//       () => authController.isLogin()
//           ? Get.offAll(() => MyBottomNavigation())
//           : Get.offAll(() => MyLoginPage()),
//     );
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     super.onClose();
//   }
// }
