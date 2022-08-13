import 'package:flutter/material.dart';

//colors
const blackColor = Colors.black;
const whiteColor = Colors.white;

//styles

const textStyle = TextStyle(
  color: whiteColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const sizedBox20 = SizedBox(
  height: 20,
);
const sizedBox10 = SizedBox(
  height: 10,
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
