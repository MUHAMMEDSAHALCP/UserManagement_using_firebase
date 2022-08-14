import 'package:flutter/material.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/utlities/constant.dart';
import 'package:user_management/view/login_view.dart';
import 'package:user_management/view/signup_view.dart';

class WelComePage extends StatelessWidget {
  static String id = "Welcome_page";

  const WelComePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Back",
              style: textStyle,
            ),
            sizedBox20,
            MaterialButtonWidget(
              text: "Login",
              onClick: () {
                Navigator.pushNamed(
                  context,
                  LoginPage.id,
                );
              },
            ),
            sizedBox10,
            MaterialButtonWidget(
              onClick: () {
                Navigator.pushNamed(
                  context,
                  SignUpPage.id,
                );
              },
              text: "Register",
            ),
          ],
        ),
      ),
    );
  }
}
