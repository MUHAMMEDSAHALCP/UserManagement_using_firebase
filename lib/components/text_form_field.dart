import 'package:flutter/material.dart';
import 'package:user_management/utlities/constant.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final bool? enable;
  final String text;
  dynamic validator;
  final TextEditingController? controller;
  TextFormFieldWidget(
      {Key? key,
      required this.text,
      this.controller,
      this.enable,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          validator: validator,
          enabled: enable,
          controller: controller,
          decoration: inputDecoration.copyWith(
              label: Text(
            text,
          )),
        ),
      ),
    );
  }
}
