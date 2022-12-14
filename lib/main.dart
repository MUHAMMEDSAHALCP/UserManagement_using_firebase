import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/controller/edit_controller.dart';
import 'package:user_management/controller/home_controller.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/controller/signup_controller.dart';
import 'package:user_management/controller/splash_controller.dart';
import 'package:user_management/view/edit_view.dart';
import 'package:user_management/view/home_view.dart';
import 'package:user_management/view/login_view.dart';
import 'package:user_management/view/signup_view.dart';
import 'package:user_management/view/splash_view.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashController(context),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpController(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickImageController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginPage.id: (context) => const LoginPage(),
          SignUpPage.id: (context) => const SignUpPage(),
          HomePage.id: (context) => const HomePage(),
          EditPage.id: (context) => EditPage(),
        },
      ),
    );
  }
}
