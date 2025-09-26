import '../cubits/auth_cubit/auth_cubit.dart';
import '../screens/auth_gate.dart';
import '../screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helper/animation.dart';
import '../utils/app_strings.dart';
import '../widgets/form_body.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.loginKey,
    this.message,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginKey;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return FormBody(
      mainButtonTitle: AppStrings.login,
      secondButtonTitle: AppStrings.register,
      text: AppStrings.loginScreenText,
      mainButtonOnTap: () async {
        if (loginKey.currentState!.validate()) {
          await BlocProvider.of<AuthCubit>(context).signinWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          );

          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              CustomAnimation.createRouteForFadeTransition(const AuthGate()),
              (route) => false,
            );
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
    );
  }
}
