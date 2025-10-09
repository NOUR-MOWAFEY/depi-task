import 'package:depi_task/utils/app_colors.dart';
import 'package:depi_task/utils/app_images.dart';
import 'package:depi_task/utils/app_validator.dart';
import 'package:depi_task/widgets/custom_button.dart';
import 'package:depi_task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/animation.dart';
import '../screens/auth_gate.dart';
import '../screens/register_screen.dart';
import '../utils/app_strings.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<AuthCubit>(context).formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(AppImages.login, height: 350, width: 350),
            const SizedBox(height: 32),

            CustomTextFormField(
              inputType: InputType.email,
              hintText: AppStrings.emailHintText,
              controller: BlocProvider.of<AuthCubit>(context).emailController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              inputType: InputType.password,
              hintText: AppStrings.passwordHintText,
              obscure: true,
              controller: BlocProvider.of<AuthCubit>(
                context,
              ).passwordController,
            ),
            const SizedBox(height: 32),
            CustomButton(
              title: AppStrings.login,
              onTap: () async {
                if (BlocProvider.of<AuthCubit>(
                  context,
                ).formKey.currentState!.validate()) {
                  context.read<AuthCubit>().signinWithEmailAndPassword();

                  Navigator.pushAndRemoveUntil(
                    context,
                    CustomAnimation.createRouteForFadeTransition(
                      const AuthGate(),
                    ),
                    (route) => false,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.loginScreenText,
                  style: const TextStyle(fontSize: 16, color: AppColors.white),
                ),
                const SizedBox(width: 6),
                CustomButton(
                  title: AppStrings.register,
                  color: Colors.transparent,
                  textColor: AppColors.white,
                  // width: 90,
                  fontSize: 16,
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    CustomAnimation.createRouteForSlideFromRight(
                      const RegisterScreen(),
                    ),
                    (route) => false,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



    // FormBody(
    //   mainButtonTitle: AppStrings.login,
    //   secondButtonTitle: AppStrings.register,
    //   text: AppStrings.loginScreenText,
    //   mainButtonOnTap: () async {
    //     if (loginKey.currentState!.validate()) {
    //       context.read<AuthCubit>().signinWithEmailAndPassword(
    //         emailController.text,
    //         passwordController.text,
    //       );

    //       Navigator.pushAndRemoveUntil(
    //         context,
    //         CustomAnimation.createRouteForFadeTransition(const AuthGate()),
    //         (route) => false,
    //       );
    //     }
    //   },
    //   secondButtonOnTap: 
    //   globalKey: loginKey,
    //   emailController: emailController,
    //   passwordController: passwordController,
    // );