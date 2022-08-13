import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/utlities/constant.dart';

class LoginPage extends StatelessWidget {
  static String id = "Login_Page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logInController = context.read<LogInController>();

    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Login",
                  style: textStyle,
                ),
              ),
              sizedBox20,
              TextFormFieldWidget(
                text: "Enter email",
                controller: logInController.emailController,
              ),
              sizedBox10,
              TextFormFieldWidget(
                text: "Enter Password",
                controller: logInController.passWordController,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
              ),
              MaterialButtonWidget(
                onClick: () {
                  logInController.logInUser(context);
                },
                text: "Login",
              )
            ],
          ),
        ),
      ),
    );
  }
}
