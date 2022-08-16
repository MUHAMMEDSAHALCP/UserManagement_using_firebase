import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/utlities/constant.dart';
import 'package:user_management/view/signup_view.dart';

class LoginPage extends StatelessWidget {
  static String id = "Login_Page";

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: context.read<LogInController>().formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "Login To Your Account",
                    style: textStyle.copyWith(fontSize: 25),
                  ),
                ),
                sizedBoxHeight50,
                TextFormFieldWidget(
                  text: "Email",
                  controller: context.read<LogInController>().emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                sizedBoxHeight20,
                TextFormFieldWidget(
                  text: "Name",
                  controller:
                      context.read<LogInController>().passWordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password";
                    } else {
                      return null;
                    }
                  },
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
                    context.read<LogInController>().validateForm(context);
                  },
                  text: "Login",
                ),
                sizedBoxHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account yet?",
                      style: TextStyle(color: whiteColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          SignUpPage.id,
                        );
                      },
                      child: Text(
                        "Create",
                        style: textStyle.copyWith(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
