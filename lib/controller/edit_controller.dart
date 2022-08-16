import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/view/login_view.dart';

class EditController extends ChangeNotifier {
  UserModel loggedUserModel = UserModel();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  UserModel userModel = UserModel();
  final auth = FirebaseAuth.instance;

// saving all data to firestore

  Future saveAllEditUserDetails(context, String newImage) async {
    final fireStore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    userModel.name = nameController.text.trim();
    userModel.email = user!.email!.trim();
    userModel.age =
        ageController.text.trim().isEmpty ? null : ageController.text.trim();
    userModel.phone = phoneNumberController.text.trim();
    userModel.id = user.uid;
    userModel.image = newImage.isEmpty ? null : newImage;
    fireStore.collection('users').doc(user.uid).update(
          userModel.toJson(),
        );
  }

  validateForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      saveAllEditUserDetails(
          context, context.read<PickImageController>().newImage);
      context.read<LogInController>().getAllUserDetails(context);
    }
  }

  logOut(context) {
    auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }
}

// fetching image
class PickImageController extends ChangeNotifier {
  String newImage = "";
  getImageFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    final bytes = File(pickedFile!.path).readAsBytesSync();
    newImage = base64Encode(bytes);
    notifyListeners();
  }
}
