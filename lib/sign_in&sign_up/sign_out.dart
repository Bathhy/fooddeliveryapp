import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';
import 'package:fodddelieveryapp/image/image_declare.dart';

class SignUPPage extends StatefulWidget {
  const SignUPPage({Key? key}) : super(key: key);

  @override
  State<SignUPPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AuthContainer(),
            const SizedBox(height: 20),
            const AuthForm(),
            CustomButton(
              title: "Login",
              callback: () {},
            )
          ],
        ),
      ),
    );
  }
}

class AuthContainer extends StatelessWidget {
  const AuthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              imageChef,
              fit: BoxFit.contain,
              width: 150,
            ),
            // const Mytabbarsignin(),
          ],
        ),
      ),
    );
  }
}

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email Address',
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
