import 'package:flutter/material.dart';

//colors
const blackColor = Colors.black;
const whiteColor = Colors.white;
const buttonColor = Color(0xffD4E3E6);

//styles

const textStyle = TextStyle(
  color: whiteColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const sizedBoxHeight20 = SizedBox(
  height: 20,
);
const sizedBoxHeight10 = SizedBox(
  height: 10,
);
const sizedBoxHeight50 = SizedBox(
  height: 50,
);

final boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: whiteColor,
);

final inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: blackColor, width: 1.0),
  ),
  border: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: blackColor, width: 2.0),
  ),
  label: const Center(
    child: Text(""),
  ),
);
