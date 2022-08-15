import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/utlities/constant.dart';
import 'package:user_management/view/edit_view.dart';

class HomePage extends StatelessWidget {
  static String id = "Home_Page";
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: buttonColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("  USER DETAILS"),
        automaticallyImplyLeading: false,
        backgroundColor: blackColor,
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          sizedBoxHeight20,
          Center(
            child: Consumer<LogInController>(
              builder: (context, value, child) {
                return value.loggedUserModel.image == "" ||
                        value.loggedUserModel.image == null
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            "https://spng.subpng.com/20201110/kku/transparent-user-icon-people-icon-man-icon-5faae2fa89f329.0070624216050347465651.jpg"),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: MemoryImage(
                          const Base64Decoder().convert(
                            value.loggedUserModel.image.toString(),
                          ),
                        ),
                      );
              },
            ),
          ),
          sizedBoxHeight20,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: boxDecoration.copyWith(
                  color: blackColor, borderRadius: BorderRadius.circular(30)),
              height: size.height / 2.3,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Consumer<LogInController>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name    :  ${value.loggedUserModel.name}",
                        style: textStyle,
                      ),
                      sizedBoxHeight20,
                      Text(
                        "Email    :  ${value.loggedUserModel.email}",
                        style: textStyle,
                      ),
                      value.loggedUserModel.age != null
                          ? sizedBoxHeight20
                          : const SizedBox(),
                      value.loggedUserModel.age != null
                          ? Text(
                              "Age      :   ${value.loggedUserModel.age}",
                              style: textStyle,
                            )
                          : const Text("Age didn't specified yet"),
                      value.loggedUserModel.age != null
                          ? sizedBoxHeight20
                          : const SizedBox(),
                      Text(
                        "Phone   :  ${value.loggedUserModel.phone}",
                        style: textStyle,
                      ),
                      sizedBoxHeight50,
                      sizedBoxHeight50,
                      MaterialButtonWidget(
                          onClick: () {
                            Navigator.pushNamed(context, EditPage.id);
                          },
                          text: "Edit Profile"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
