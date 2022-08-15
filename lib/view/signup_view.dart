import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/signup_controller.dart';
import 'package:user_management/utlities/constant.dart';
import 'package:user_management/view/login_view.dart';

class SignUpPage extends StatelessWidget {
  static String id = "signUp-view";

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerController = context.read<SignUpController>();

    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 15,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Center(
                child: Text(
                  "Create New Account",
                  style: textStyle.copyWith(fontSize: 25),
                ),
              ),

              sizedBoxHeight50,
              TextFormFieldWidget(
                text: "Enter your name",
                controller: registerController.nameController,
              ),
              sizedBoxHeight20,
              TextFormFieldWidget(
                  text: "Enter your Email",
                  controller: registerController.emailController),
              sizedBoxHeight20,
              TextFormFieldWidget(
                text: "Enter your phone",
                controller: registerController.phoneNumberController,
              ),
              sizedBoxHeight20,
              TextFormFieldWidget(
                  text: "Enter password",
                  controller: registerController.passwordController),
              sizedBoxHeight20,
              // const TextFormFieldWidget(text: " Re-enter Password"),
              // sizedBox20,
              MaterialButtonWidget(
                onClick: () async {
                  final errorMessage =
                      await registerController.registerUser(context);
                  // ignore: use_build_context_synchronously
                  registerController.checkFormField(context, errorMessage);
                },
                text: "Signup",
              ),
              sizedBoxHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: whiteColor),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        LoginPage.id,
                      );
                    },
                    child: Text(
                      "LogIn",
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
