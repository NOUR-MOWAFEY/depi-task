import 'package:depi_task/utils/app_validator.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscure = false,
    required this.controller,
    required this.inputType,
    this.enabled = true,
  });
  final String? hintText;
  final bool? obscure;
  final bool? enabled;
  final TextEditingController controller;
  final InputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: const TextStyle(color: AppColors.white),
      validator: (input) {
        return AppValidator.validator(input, inputType);
      },
      controller: controller,
      cursorColor: AppColors.white,
      obscureText: obscure!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.white),
        border: customOutlineInputBorder(color: AppColors.primaryColor),
        focusedBorder: customOutlineInputBorder(borderWidth: 2),
        disabledBorder: customOutlineInputBorder(color: Colors.blueGrey),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({
    Color? color,
    double? borderWidth,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: color ?? AppColors.white,
      width: borderWidth ?? 1,
    ),
  );
}
