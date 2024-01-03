import 'package:fodddelieveryapp/Homepage/Home_screen.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  void navigateTohome() {
    Get.off(() => Homescreen());
  }
}
