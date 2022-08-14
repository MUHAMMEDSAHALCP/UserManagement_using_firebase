import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/login_view.dart';

class EditController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  UserModel userModel = UserModel();
  final auth = FirebaseAuth.instance;

  Future saveAllEditUserDetails(context) async {
    final fireStore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    userModel.name = nameController.text;
    userModel.email = user!.email;
    userModel.age = ageController.text;
    userModel.phone = phoneNumberController.text;
    userModel.id = user.uid;
    fireStore.collection('users').doc(user.uid).update(
          userModel.toJson(),
        );
  }

  logOut(context) {
    auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }
}
