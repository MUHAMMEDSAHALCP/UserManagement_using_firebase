import 'package:flutter/material.dart';
import 'package:user_management/utlities/constant.dart';

class MaterialButtonWidget extends StatelessWidget {
  final Function() onClick;
  final String text;

  const MaterialButtonWidget({
    Key? key,
    required this.onClick,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
