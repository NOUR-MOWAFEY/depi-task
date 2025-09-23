import 'package:depi_task/utils/app_colors.dart';
import 'package:depi_task/utils/app_images.dart';
import 'package:depi_task/utils/app_strings.dart';
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
  });
  final String mainButtonTitle;
  final String secondButtonTitle;
  final String text;
  final void Function()? mainButtonOnTap;
  final void Function()? secondButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Image.asset(AppImages.loginImage, height: 350, width: 350),
          SizedBox(height: 32),

          CustomTextFormField(hintText: AppStrings.emailHintText),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: AppStrings.passwordHintText,
            obscure: true,
          ),
          SizedBox(height: 32),
          CustomButton(title: mainButtonTitle, onTap: mainButtonOnTap),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 16, color: AppColors.black),
              ),
              SizedBox(width: 6),
              CustomButton(
                title: secondButtonTitle,
                color: Colors.transparent,
                textColor: AppColors.black,
                // width: 90,
                fontSize: 16,
                onTap: secondButtonOnTap,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
