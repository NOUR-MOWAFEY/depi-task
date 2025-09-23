import 'dart:developer';

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
      appBar: AppBar(title: Text('Login')),
      body: FormBody(
        mainButtonTitle: AppStrings.login,
        secondButtonTitle: AppStrings.register,
        text: AppStrings.loginScreenText,
        mainButtonOnTap: () {
          if (loginKey.currentState!.validate()) {
            log('Validated');
          }
        },
        secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
          context,
          _createRoute(RegisterScreen()),
          (route) => false,
        ),
        globalKey: loginKey,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}

Route<void> _createRoute(Widget child) {
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
