import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/constant_color.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/controller/auth_control.dart';
import 'package:fodddelieveryapp/controller/signin_controller.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';
import 'package:get/get.dart';

class MyLoginPage extends StatelessWidget {
  MyLoginPage({Key? key}) : super();
  final Authcontroller authController = Get.find();
  final LoginTabController _tabcontrol = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colorGrey,
        body: _bodyOfLogin(),
      ),
    );
  }

  Widget _bodyOfLogin() {
    return Column(
      children: [
        _tabbarfunct(),
        SizedBox(
          height: 50,
        ),
        _tabbarviewFunct(),
      ],
    );
  }

  Widget _tabbarfunct() {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              imageChef,
              fit: BoxFit.contain,
              width: 150,
            ),
            Column(
              children: [
                TabBar(
                  controller: _tabcontrol.controller,
                  tabs: _tabcontrol.logintab,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tabbarviewFunct() {
    return Expanded(
      child: TabBarView(
        controller: _tabcontrol.controller,
        children: [_LoginView(), _SignUpView()],
      ),
    );
  }

  Widget _LoginView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: authController.Lemail,
              decoration: const InputDecoration(
                  labelText: 'Email Address', hintText: 'messi@gmail.com'),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => TextFormField(
                controller: authController.Lpassword,
                obscureText: authController.ispasshidden.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    suffixIcon: InkWell(
                      child: Icon(
                          authController.ispasshidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                          size: 25),
                      onTap: () {
                        authController.toggleObscureText();
                      },
                    )),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: const Text(
                  "Forget Passcode?",
                  style: TextStyle(
                    fontSize: 14,
                    color: colorOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: CustomButton(
              title: "Login",
              callback: () {
                // Call the login method from AuthController
                authController.login(
                  authController.Lemail.text,
                  authController.Lpassword.text,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _SignUpView() {
    final Authcontroller _authController = Get.find();
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _authController.Remail,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'messi@gmail.com',
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => TextFormField(
                controller: _authController.Rpassword,
                obscureText: authController.ispasshidden.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  suffixIcon: InkWell(
                    child: Icon(
                        authController.ispasshidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                        size: 25),
                    onTap: () {
                      authController.toggleObscureText();
                    },
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => TextFormField(
                controller: _authController.RcPassword,
                obscureText: authController.confirmpasshiden.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Enter password',
                  suffixIcon: InkWell(
                    child: Icon(
                        authController.confirmpasshiden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                        size: 25),
                    onTap: () {
                      authController.ConfirmtoggleObscureText();
                    },
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: CustomButton(
              title: "Sign Up",
              callback: () {
                _authController.register(
                    _authController.Remail.text,
                    _authController.Rpassword.text,
                    _authController.RcPassword.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
