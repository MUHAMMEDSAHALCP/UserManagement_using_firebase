import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/utlities/constant.dart';

class HomePage extends StatelessWidget {
  static String id = "Home_Page";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text("  USER DETAILS"),
        automaticallyImplyLeading: false,
        backgroundColor: blackColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
              sizedBox20,
              const TextFormFieldWidget(text: ""),
              sizedBox10,
              const TextFormFieldWidget(text: ""),
              sizedBox10,
              const TextFormFieldWidget(text: ""),
              sizedBox20,
              const TextFormFieldWidget(text: ""),
              sizedBox20,
              const TextFormFieldWidget(text: ""),
              sizedBox20,
              MaterialButtonWidget(onClick: () {}, text: "save")
            ],
          ),
        ),
      ),
    );
  }
}
