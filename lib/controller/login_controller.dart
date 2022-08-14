import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/home_view.dart';

class LogInController extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passWordController = TextEditingController();
  UserModel loggedUserModel = UserModel();

  logInUser(context) async {
    try {
      _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passWordController.text)
          .then(
            (value) => getAllUserDetails(context),
          );
    } catch (e) {
      log(" Error: $e");
    }
  }

  // getting User model from firestore
  getAllUserDetails(context) async {
    User? user = _auth.currentUser;
    fireStore.collection('users').doc(user!.uid).get().then(
      (value) {
        loggedUserModel = UserModel.fromJson(value.data()!);
        log("$loggedUserModel");
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.id,
          (route) => false,
        );
      },
    );
  }
}
