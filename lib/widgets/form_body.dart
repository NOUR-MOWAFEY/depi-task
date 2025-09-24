import 'package:depi_task/utils/app_colors.dart';
import 'package:depi_task/utils/app_images.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/utils/app_validator.dart';
import 'package:depi_task/widgets/custom_button.dart';
import 'package:depi_task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class FormBody extends StatelessWidget {
  const FormBody({
    super.key,
    required this.mainButtonTitle,
    required this.secondButtonTitle,
    required this.text,
    this.mainButtonOnTap,
    this.secondButtonOnTap,
    required this.globalKey,
    required this.emailController,
    required this.passwordController,
  });
  final String mainButtonTitle;
  final String secondButtonTitle;
  final String text;
  final void Function()? mainButtonOnTap;
  final void Function()? secondButtonOnTap;
  final GlobalKey globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(AppImages.login, height: 350, width: 350),
            const SizedBox(height: 32),

            CustomTextFormField(
              validator: (value) =>
                  AppValidator.validator(value, InputType.email),
              hintText: AppStrings.emailHintText,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) =>
                  AppValidator.validator(value, InputType.password),
              hintText: AppStrings.passwordHintText,
              obscure: true,
              controller: passwordController,
            ),
            const SizedBox(height: 32),
            CustomButton(title: mainButtonTitle, onTap: mainButtonOnTap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: AppColors.white),
                ),
                const SizedBox(width: 6),
                CustomButton(
                  title: secondButtonTitle,
                  color: Colors.transparent,
                  textColor: AppColors.white,
                  // width: 90,
                  fontSize: 16,
                  onTap: secondButtonOnTap,
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
