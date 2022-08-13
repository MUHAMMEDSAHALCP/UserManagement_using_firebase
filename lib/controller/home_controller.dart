import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class HomePageController extends ChangeNotifier {
  final auth = FirebaseAuth.instance;
  late User loggedInUser;

  HomePageController() {
    getCurrentUser();
  }

  getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      if (kDebugMode) {
        print("error  $e");
      }
    }
  }
}
