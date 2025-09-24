import 'package:depi_task/screens/login_screen.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/widgets/form_body.dart';
import 'package:flutter/material.dart';

import '../helper/firebase_methods.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: FormBody(
        mainButtonTitle: AppStrings.register,
        secondButtonTitle: AppStrings.login,
        text: AppStrings.registerScreenText,
        secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
          context,
          _createRoute(const LoginScreen()),
          (route) => false,
        ),
        globalKey: registerKey,
        emailController: emailController,
        passwordController: passwordController,
        mainButtonOnTap: () {
          if (registerKey.currentState!.validate()) {
            FirebaseMethods.createAccount(
              emailAddress: emailController.text,
              password: passwordController.text,
            );
            Navigator.pushAndRemoveUntil(
              context,
              _createRoute(const LoginScreen()),
              (route) => false,
            );
          }
        },
      ),
    );
  }
}

Route<void> _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0); // 👈 from the left
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
