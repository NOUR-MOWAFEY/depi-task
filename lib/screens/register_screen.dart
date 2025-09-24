import 'package:flutter/material.dart';

import '../helper/animation.dart';
import '../helper/firebase_methods.dart';
import '../helper/show_snack_bar.dart';
import '../utils/app_strings.dart';
import '../widgets/form_body.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: FormBody(
        mainButtonTitle: AppStrings.register,
        secondButtonTitle: AppStrings.login,
        text: AppStrings.registerScreenText,
        secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
          context,
          CustomAnimation.createRouteForSlideFromLeft(const LoginScreen()),
          (route) => false,
        ),
        globalKey: registerKey,
        emailController: emailController,
        passwordController: passwordController,
        mainButtonOnTap: () async {
          if (registerKey.currentState!.validate()) {
            try {
              await FirebaseMethods.createAccount(
                emailAddress: emailController.text,
                password: passwordController.text,
              );
              if (context.mounted) {
                showSnackBar(
                  context: context,
                  color: Colors.green,
                  exception: 'registration done successfully',
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  CustomAnimation.createRouteForSlideFromLeft(
                    const LoginScreen(),
                  ),
                  (route) => false,
                );
              }
            } catch (e) {
              if (context.mounted) {
                showSnackBar(context: context, exception: e, color: Colors.red);
              }
            }
          }
        },
      ),
    );
  }
}
