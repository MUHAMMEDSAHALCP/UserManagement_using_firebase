import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_management/components/snackbar.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/home_view.dart';

class LogInController extends ChangeNotifier {
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  Stream<User?> stream() => _auth.authStateChanges();
  final emailController = TextEditingController();
  final passWordController = TextEditingController();
  UserModel loggedUserModel = UserModel();
  Future<String> logInUser(context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passWordController.text)
          .then(
            (value) => getAllUserDetails(context),
          );
      return Future.value("");
    } on FirebaseAuthException catch (e) {
      log(" Error: $e");
      return Future.value(e.message);
    }
  }

  checkFormField(BuildContext context, errorMessage) async {
    if (errorMessage != "") {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      SnackBarWidget.chekFormFill(context, errorMessage);
    } else {
      return;
    }
  }

  validateForm(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final errorMessage = await logInUser(context);
      // ignore: use_build_context_synchronously
      checkFormField(context, errorMessage);
    }
  }

  // getting User data from firestore
  getAllUserDetails(context) async {
    User? user = _auth.currentUser;
    fireStore.collection('users').doc(user!.uid).get().then(
      (value) {
        loggedUserModel = UserModel.fromJson(value.data()!);
        log("$loggedUserModel");
        notifyListeners();
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.id, (route) => false);
      },
    );
  }
}
