import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/controller/home_controller.dart';
import 'package:user_management/controller/login_controller.dart';
import 'package:user_management/controller/registration_controller.dart';
import 'package:user_management/view/home_view.dart';
import 'package:user_management/view/login_view.dart';
import 'package:user_management/view/register_view.dart';
import 'package:user_management/view/welcome_view.dart';

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
          create: (context) => RegisterController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelComePage.id,
        routes: {
          WelComePage.id: (context) => const WelComePage(),
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          HomePage.id: (context) => const HomePage(),
        },
      ),
    );
  }
}
