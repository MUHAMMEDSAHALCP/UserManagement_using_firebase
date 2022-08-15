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
              Center(
                child: Text(
                  "Login To Your Account",
                  style: textStyle.copyWith(fontSize: 25),
                ),
              ),
              sizedBoxHeight50,
              TextFormFieldWidget(
                text: "Enter your email",
                controller: logInController.emailController,
              ),
              sizedBoxHeight20,
              TextFormFieldWidget(
                text: "Enter your Password",
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
                onClick: () async {
                  final errorMessage = await logInController.logInUser(context);
                  // ignore: use_build_context_synchronously
                  logInController.checkFormField(context, errorMessage);
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
    );
  }
}
