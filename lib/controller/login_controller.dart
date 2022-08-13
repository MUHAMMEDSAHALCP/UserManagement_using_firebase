import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_management/view/home_view.dart';

class LogInController extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passWordController = TextEditingController();


  logInUser(context) async {
    try {
    final  user = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passWordController.text);

      user != null ? Navigator.pushNamed(context, HomePage.id) : "";
    } catch (e) {
      log(" Error: $e");
    }
  }
}
