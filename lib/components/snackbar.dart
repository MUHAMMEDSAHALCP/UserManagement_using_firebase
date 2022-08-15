import 'package:flutter/material.dart';
import 'package:user_management/utlities/constant.dart';

class SnackBarWidget {
    static chekFormFill(context, errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(5),
        backgroundColor: whiteColor,
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color: blackColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
