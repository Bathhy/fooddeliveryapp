import 'package:flutter/material.dart';
import 'package:fodddelieveryapp/component/custom_button.dart';

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
