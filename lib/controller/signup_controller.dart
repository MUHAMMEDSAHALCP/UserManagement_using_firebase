import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/login_view.dart';

class SignUpController extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  UserModel userModel = UserModel();

  dynamic newUser;

  registerUser(context) async {
    try {
      newUser = await _auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) => addAllUserDetails(context));
    } catch (e) {
      log("$e");
    }
  }

// adding user model to firestore
  Future addAllUserDetails(context) async {
    final fireStore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;
    userModel.email = user!.email;
    userModel.phone = phoneNumberController.text;
    userModel.id = user.uid;
    fireStore.collection("users").doc(user.uid).set(
          userModel.toJson(),
        );
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }
}
