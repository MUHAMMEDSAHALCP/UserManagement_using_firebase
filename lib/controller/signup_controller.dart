import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/home_view.dart';

class SignUpController extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  dynamic newUser;

  registerUser(context) async {
    try {
      newUser = await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) => registerAllUserDetails(context));
    } catch (e) {
      log("$e");
    }
    Navigator.pushNamed(context, HomePage.id);
  }

  Future registerAllUserDetails(context) async {
    UserModel userModel = UserModel();
    userModel.name = nameController.text;
    userModel.email = emailController.text;
    userModel.phone = phoneNumberController.text;
    userModel.id = DateTime.now().microsecondsSinceEpoch.toString();

    fireStore.collection("users").doc(userModel.id).set(
          userModel.toJson(),
        );
  }
}
