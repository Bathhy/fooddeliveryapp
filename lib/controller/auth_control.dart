import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/component/custom_user.dart';
import 'package:fodddelieveryapp/sign_in&sign_up/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Authcontroller extends GetxController {
  final box = GetStorage();
  Rx<User> user = User(email: "", password: "").obs;
  final Remail = TextEditingController();
  final Rpassword = TextEditingController();
  final RcPassword = TextEditingController();
  final Lemail = TextEditingController();
  final Lpassword = TextEditingController();

  void register(String email, String password, String cpassword) async {
    if (email == "" || password == "" || cpassword == "") {
      Get.snackbar("Error", "Field null");
    } else {
      user.value = User(email: email, password: password);
      box.write('user', {'email': email, 'password': password});
      Get.snackbar("Succes", "Register success");
    }
  }

  void login(String email, String password) async {
    if (email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      final getUser = box.read('user');
      if (email == getUser?['email'] && password == getUser?['password']) {
        Get.offAll(() => MyBottomNavigation());
        box.write('isLogin', true);
      } else {
        Get.snackbar("Error", "No Account");
      }
    }
  }

  void logout() async {
    box.remove('isLogin');
    Get.offAll(MyLoginPage());
  }

  bool isLogin() {
    return box.read('isLogin') ?? false;
  }
}
