import 'package:flutter/material.dart';
import 'package:user_management/controller/splash_controller.dart';
import 'package:user_management/utlities/constant.dart';

class SplashScreen extends StatelessWidget {
  static String id = "Welcome_page";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text(
                "WELCOME BACK",
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
