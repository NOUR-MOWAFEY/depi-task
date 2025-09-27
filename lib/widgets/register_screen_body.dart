import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/animation.dart';
import '../screens/login_screen.dart';
import '../utils/app_strings.dart';
import '../widgets/form_body.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.registerKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> registerKey;

  @override
  Widget build(BuildContext context) {
    return FormBody(
      mainButtonTitle: AppStrings.register,
      secondButtonTitle: AppStrings.login,
      text: AppStrings.registerScreenText,
      globalKey: registerKey,
      emailController: emailController,
      passwordController: passwordController,
      secondButtonOnTap: () => Navigator.pushAndRemoveUntil(
        context,
        CustomAnimation.createRouteForSlideFromLeft(const LoginScreen()),
        (route) => false,
      ),
      mainButtonOnTap: () async {
        if (registerKey.currentState!.validate()) {
           context.read<AuthCubit>().registerWithEmailAndPassword(
            emailController.text,
            passwordController.text,
            context,
          );
        }
      },
    );
  }
}
