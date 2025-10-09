import 'package:depi_task/utils/app_colors.dart';
import 'package:depi_task/utils/app_validator.dart';
import 'package:depi_task/widgets/custom_button.dart';
import 'package:depi_task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/animation.dart';
import '../screens/login_screen.dart';
import '../utils/app_strings.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomTextFormField(
              controller: context.read<AuthCubit>().fistNameController,
              hintText: 'first name',
              inputType: InputType.firstName,
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              controller: context.read<AuthCubit>().lastNameController,
              hintText: 'last name',
              inputType: InputType.lastName,
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              inputType: InputType.email,
              hintText: AppStrings.emailHintText,
              controller: context.read<AuthCubit>().emailController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              inputType: InputType.password,
              hintText: AppStrings.passwordHintText,
              obscure: true,
              controller: context.read<AuthCubit>().passwordController,
            ),
            const SizedBox(height: 32),
            CustomButton(
              title: AppStrings.register,
              onTap: () async {
                if (context
                    .read<AuthCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  context.read<AuthCubit>().registerWithEmailAndPassword(
                    context.read<AuthCubit>().emailController.text,
                    context.read<AuthCubit>().passwordController.text,
                    context,
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.registerScreenText,
                  style: const TextStyle(fontSize: 16, color: AppColors.white),
                ),
                const SizedBox(width: 6),
                CustomButton(
                  title: AppStrings.login,
                  color: Colors.transparent,
                  textColor: AppColors.white,
                  // width: 90,
                  fontSize: 16,
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    CustomAnimation.createRouteForSlideFromLeft(
                      const LoginScreen(),
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
