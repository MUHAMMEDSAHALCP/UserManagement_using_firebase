import 'package:flutter/material.dart';
import 'package:user_management/controller/splash_controller.dart';
import 'package:user_management/utlities/constant.dart';

class SplashScreen extends StatelessWidget {
  static String id = "Welcome_page";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController(context);
    return Scaffold(
      body: Column(
        children: const [
          Text(
            "USER MANAGEMENT",
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
