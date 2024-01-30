import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/Homepage/bottomnavi_bar.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_user.dart';
import 'package:fodddelieveryapp/sign_in&sign_up/login_page.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authcontroller extends GetxController {
//   final box = GetStorage();
  Rx<User> user = User(email: "", password: "").obs;
  final Remail = TextEditingController(text: "messi@gmail.com");
  final Rpassword = TextEditingController(text: "idk");
  final RcPassword = TextEditingController(text: "idk");
  final Lemail = TextEditingController(text: "messi@gmail.com");
  final Lpassword = TextEditingController(text: "idk");
  var ispasshidden = true.obs;
  var confirmpasshiden = true.obs;
  final TextEditingController passwordController = TextEditingController();
  void register(String email, String password, String cpassword) async {
    if (email == "" || password == "" || cpassword == "") {
      Get.snackbar("Error", "Field null",
          backgroundColor: Colors.red,
          colorText: colorGrey,
          duration: Duration(seconds: 1));
    } else {
      user.value = User(email: email, password: password);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', email);
      pref.setString('password', password);
      Get.snackbar("Succes", "Register success",
          backgroundColor: Colors.green,
          colorText: colorGrey,
          duration: Duration(seconds: 1));
    }
  }

  void login(String email, String password) async {
    if (email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final storeemail = prefs.getString('email');
      final storepass = prefs.getString('password');
      if (email == storeemail && password == storepass) {
        Get.offAll(() => MyBottomNavigation());
        prefs.setBool('islogin', true);
      } else {
        Get.snackbar("Error", "No Account",
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
            colorText: colorGrey);
      }
    }
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('islogin');
    Get.offAll(MyLoginPage());
  }

  Future<bool> isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('isLogin') ?? false;
  }

  void toggleObscureText() {
    ispasshidden.value = !ispasshidden.value;
  }

  void ConfirmtoggleObscureText() {
    confirmpasshiden.value = !confirmpasshiden.value;
  }

  void clearlogin() {
    Lemail.clear();
    Lpassword.clear();
  }
  void clearReg(){
    Remail.clear();
    Rpassword.clear();
    RcPassword.clear();
  }
}
