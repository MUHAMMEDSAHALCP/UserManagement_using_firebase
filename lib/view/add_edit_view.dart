import 'package:flutter/material.dart';
import 'package:user_management/components/material_button.dart';
import 'package:user_management/components/text_form_field.dart';
import 'package:user_management/utlities/constant.dart';

enum ActionType {
  editPage,
  addPage,
}

class AddEditPage extends StatelessWidget {
  final Action type;
  const AddEditPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Padding(
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
