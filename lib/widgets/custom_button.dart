import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.color = AppColors.primaryColor,
    this.height = 50,
    this.textColor = AppColors.white,
    this.width,
    this.fontSize = 22,
    this.onTap,
    this.fontWeight,
  });

  final String title;
  final Color color;
  final Color textColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final void Function()? onTap;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
