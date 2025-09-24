import 'dart:developer';

import '../helper/animation.dart';
import '../helper/firebase_methods.dart';
import '../helper/show_snack_bar.dart';
import 'home_screen.dart';
import 'register_screen.dart';
import '../utils/app_strings.dart';
import '../widgets/form_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  CustomAnimation.createRouteForFadeTransition(
                    const HomeScreen(),
                  ),
                  (route) => false,
                );
              }
            } catch (e) {
              if (context.mounted) {
                showSnackBar(context: context, exception: e, color: Colors.red);
              }
              log(e.toString());
            }
          }
        },
        secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
          context,
          CustomAnimation.createRouteForSlideFromRight(const RegisterScreen()),
          (route) => false,
        ),
        globalKey: loginKey,
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}
