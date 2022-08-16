import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/edit_controller.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/utlities/constant.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {
  static String id = "Edit_page";
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editController = context.read<EditController>();
    final logInController = context.read<LogInController>();
    final pickImageController = context.read<PickImageController>();
    editController.ageController.text =
        logInController.loggedUserModel.age != null
            ? logInController.loggedUserModel.age.toString()
            : "";
    editController.nameController.text = logInController.loggedUserModel.name!;
    editController.emailController.text =
        logInController.loggedUserModel.email!;
    editController.phoneNumberController.text =
        logInController.loggedUserModel.phone!;
    return Scaffold(
      body: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          title: const Text("Edit Profile"),
          centerTitle: true,
          backgroundColor: blackColor,
          actions: [
            IconButton(
              onPressed: () {
                editController.logOut(context);
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: context.read<EditController>().formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      pickImageController.getImageFromGallery();
                    },
                    child: context
                            .watch<PickImageController>()
                            .newImage
                            .isNotEmpty
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: MemoryImage(
                              const Base64Decoder().convert(
                                context.watch<PickImageController>().newImage,
                              ),
                            ),
                          )
                        : const CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage(
                                "https://spng.subpng.com/20201110/kku/transparent-user-icon-people-icon-man-icon-5faae2fa89f329.0070624216050347465651.jpg"),
                          ),
                  ),
                ),
                sizedBoxHeight20,
                TextFormFieldWidget(
                  text: "Name",
                  controller: editController.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your Name';
                    } else {
                      return null;
                    }
                  },
                ),
                sizedBoxHeight20,
                TextFormFieldWidget(
                  text: "Email",
                  controller: editController.emailController,
                  enable: false,
                ),
                sizedBoxHeight10,
                TextFormFieldWidget(
                  text: "Age",
                  controller: editController.ageController,
                ),
                sizedBoxHeight20,
                TextFormFieldWidget(
                  text: "Phone",
                  controller: editController.phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your phone';
                    } else {
                      return null;
                    }
                  },
                ),
                sizedBoxHeight20,
                MaterialButtonWidget(
                  onClick: () {
                    editController.validateForm(context);
                  },
                  text: "save",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
