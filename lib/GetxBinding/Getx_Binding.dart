import 'package:fodddelieveryapp/controller/home_controller.dart';
import 'package:fodddelieveryapp/controller/profile_controller.dart';
import 'package:fodddelieveryapp/controller/signin_controller.dart';
// import 'package:fodddelieveryapp/controller/signin_controller.dart';
import 'package:get/get.dart';

class FoodBinding extends Bindings {
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(LoginTabController());
  }
}
