import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/registration_controller.dart';
import 'package:user_management/utlities/constant.dart';

class RegisterPage extends StatelessWidget {
  static String id = "Register_Page";

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerController = context.read<RegisterController>();

    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 15,
          ),
          child: ListView(
            children: [
              const Center(
                child: Text(
                  "Register",
                  style: textStyle,
                ),
              ),
              sizedBox20,
              TextFormFieldWidget(
                text: "Enter name",
                controller: registerController.nameController,
              ),
              sizedBox10,
              TextFormFieldWidget(
                  text: "Enter Email",
                  controller: registerController.emailController),
              sizedBox10,
              TextFormFieldWidget(
                text: "Enter phone",
                controller: registerController.phoneNumberController,
              ),
              sizedBox10,
              TextFormFieldWidget(
                  text: "Enter password",
                  controller: registerController.passwordController),
              sizedBox10,
              // const TextFormFieldWidget(text: " Re-enter Password"),
              // sizedBox20,
              MaterialButtonWidget(
                  onClick: () {
                    registerController.registerUser(context);
                  },
                  text: "Register")
            ],
          ),
        ),
      ),
    );
  }
}
