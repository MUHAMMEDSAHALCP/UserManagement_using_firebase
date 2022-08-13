import 'package:flutter/material.dart';
import 'package:user_management/utlities/constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  const TextFormFieldWidget({Key? key, required this.text, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
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
