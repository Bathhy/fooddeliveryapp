import 'package:fodddelieveryapp/component/custom_listview.dart';
import 'package:fodddelieveryapp/controller/add_fav_controller.dart';
import 'package:fodddelieveryapp/controller/bottom_navi_controller.dart';
import 'package:fodddelieveryapp/controller/cart_controller.dart';
import 'package:fodddelieveryapp/controller/food_detail_control.dart';
import 'package:fodddelieveryapp/controller/history_controller.dart';
import 'package:fodddelieveryapp/controller/home_controller.dart';
import 'package:fodddelieveryapp/controller/auth_control.dart';
import 'package:fodddelieveryapp/controller/profile_controller.dart';
import 'package:fodddelieveryapp/controller/signin_controller.dart';
import 'package:fodddelieveryapp/controller/splash_controller.dart';
// import 'package:fodddelieveryapp/controller/signin_controller.dart';
import 'package:get/get.dart';

class FoodBinding extends Bindings {
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(LoginTabController());
    Get.put(BottomNaviController());
    Get.put(Authcontroller());
    Get.put(SplashController());
    Get.put(DetailController());
    Get.put(HistoryController());
    Get.put(AddFavouriteController());
    Get.put(AddtoCartController());
  }
}
