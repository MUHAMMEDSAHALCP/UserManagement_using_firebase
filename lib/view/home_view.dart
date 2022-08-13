import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/controller/signup_controller.dart';
import 'package:user_management/utlities/constant.dart';

class HomePage extends StatelessWidget {
  static String id = "Home_Page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SignUpController>().getAllUserDetails();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("  USER DETAILS"),
        automaticallyImplyLeading: false,
        backgroundColor: blackColor,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          sizedBox20,
          const Center(
            child: CircleAvatar(
              radius: 80,
            ),
          ),
          sizedBox20,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: boxDecoration.copyWith(color: blackColor),
              height: size.height / 2,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name    :",
                      style: textStyle,
                    ),
                    sizedBox20,
                    const Text(
                      "Email    :",
                      style: textStyle,
                    ),
                    sizedBox20,
                    const Text(
                      "Age       :",
                      style: textStyle,
                    ),
                    sizedBox20,
                    const Text(
                      "Phone   :",
                      style: textStyle,
                    ),
                    SizedBox(
                      height: size.height / 5,
                    ),
                    MaterialButtonWidget(onClick: () {}, text: "Edit Profile")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
