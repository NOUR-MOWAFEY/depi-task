import 'package:depi_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class FailedHomeScreenBody extends StatelessWidget {
  const FailedHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Something went wrong',
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
