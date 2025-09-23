import 'package:depi_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.obscure = false,
    required this.controller,
    this.validator,
  });
  final String? hintText;
  final bool? obscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      obscureText: obscure!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.primaryColor),
        border: customOutlineInputBorder(color: AppColors.primaryColor),
        focusedBorder: customOutlineInputBorder(borderWidth: 2),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder({
    Color? color,
    double? borderWidth,
  }) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: color ?? Colors.black,
      width: borderWidth ?? 1,
    ),
  );
}
