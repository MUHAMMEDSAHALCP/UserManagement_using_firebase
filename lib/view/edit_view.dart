import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/controller/edit_controller.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/utlities/constant.dart';
import 'package:user_management/view/home_view.dart';

class EditPage extends StatelessWidget {
  static String id = "Edit_page";
  const EditPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final editController = context.read<EditController>();
    final logInController = context.read<LogInController>();
    editController.ageController.text =
        logInController.loggedUserModel.age == null
            ? ""
            : logInController.loggedUserModel.age.toString();
    editController.nameController.text =
        logInController.loggedUserModel.name.toString();
    editController.emailController.text =
        logInController.loggedUserModel.email.toString();
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              sizedBox20,
              TextFormFieldWidget(
                text: "Name",
                controller: editController.nameController,
              ),
              sizedBox10,
              TextFormFieldWidget(
                text: "Email",
                controller: editController.emailController,
                enable: false,
              ),
              sizedBox10,
              TextFormFieldWidget(
                text: "Age",
                controller: editController.ageController,
              ),
              sizedBox20,
              TextFormFieldWidget(
                text: "Phone",
                controller: editController.phoneNumberController,
              ),
              sizedBox20,
              MaterialButtonWidget(
                onClick: () {
                  editController.saveAllEditUserDetails(context);
                  logInController.getAllUserDetails(context);
                  Navigator.popAndPushNamed(
                    context,
                    HomePage.id,
                  );
                },
                text: "save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
