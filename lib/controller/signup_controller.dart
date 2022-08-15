import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management/components/snackbar.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/login_view.dart';

class SignUpController extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  UserModel userModel = UserModel();
  SnackBarWidget snackBarWidget = SnackBarWidget();
  dynamic newUser;
  Future<String> registerUser(context) async {
    try {
      newUser = await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then(
            (value) => addAllUserDetails(context),
          );
      return Future.value("");
    } on FirebaseAuthException catch (e) {
      log("$e");
      return Future.value(e.message);
    }
  }

  checkFormField(BuildContext context, errorMessage) async {
    if (errorMessage == "") {
      return;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      SnackBarWidget.chekFormFill(context, errorMessage);
    }
  }

// adding user data to firestore
  Future addAllUserDetails(context) async {
    final fireStore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    userModel.name = nameController.text.trim();
    userModel.email = user!.email!.trim();
    userModel.phone = phoneNumberController.text.trim();
    userModel.id = user.uid;
    fireStore.collection("users").doc(user.uid).set(
          userModel.toJson(),
        );
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }
}
