import 'dart:developer';

import 'package:depi_task/helper/firebase_methods.dart';
import 'package:depi_task/screens/home_screen.dart';
import 'package:depi_task/screens/register_screen.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/widgets/form_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: FormBody(
        mainButtonTitle: AppStrings.login,
        secondButtonTitle: AppStrings.register,
        text: AppStrings.loginScreenText,
        mainButtonOnTap: () async {
          if (loginKey.currentState!.validate()) {
            try {
              await FirebaseMethods.loginWithEmailAndPassword(
                emailAddress: emailController.text,
                password: passwordController.text,
              );

              Navigator.pushAndRemoveUntil(
                context,
                _createRouteForFadeTransition(const HomeScreen()),
                (route) => false,
              );
            } catch (e) {
              log(e.toString());
            }
          }
        },
        secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
          context,
          _createRouteForFromLeftTransition(const RegisterScreen()),
          (route) => false,
        ),
        globalKey: loginKey,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}

Route<void> _createRouteForFromLeftTransition(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}

Route<void> _createRouteForFadeTransition(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
