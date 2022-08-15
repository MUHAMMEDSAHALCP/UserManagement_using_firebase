import 'package:flutter/cupertino.dart';
import 'package:user_management/view/login_view.dart';

class SplashController extends ChangeNotifier {
  SplashController(context) {
    goToLoginPage(context);
  }

  goToLoginPage(context) {

    
    Future.delayed(
      const Duration(seconds: 3),
      (() => Navigator.pushNamed(context, LoginPage.id)),
    );
  }
}
