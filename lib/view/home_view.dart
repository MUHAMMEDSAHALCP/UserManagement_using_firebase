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
                child: Consumer<LogInController>(
                  builder: (context, value, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name    :  ${value.loggedUserModel.name}",
                        style: textStyle,
                      ),
                      sizedBox20,
                      Text(
                        "Email    :  ${value.loggedUserModel.email}",
                        style: textStyle,
                      ),
                      sizedBox20,
                      value.loggedUserModel.age == null
                          ? Visibility(
                              visible: false,
                              child: Text(
                                "Age      :   ${value.loggedUserModel.age}",
                                style: textStyle,
                              ),
                            )
                          : Text(
                              "Age       :   ${value.loggedUserModel.age}",
                              style: textStyle,
                            ),
                      sizedBox20,
                      Text(
                        "Phone   :  ${value.loggedUserModel.phone}",
                        style: textStyle,
                      ),
                      SizedBox(
                        height: size.height / 5,
                      ),
                      MaterialButtonWidget(
                          onClick: () {
                            Navigator.pushNamed(context, EditPage.id);
                          },
                          text: "Edit Profile")
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
