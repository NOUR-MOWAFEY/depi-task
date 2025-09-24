import 'package:depi_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingHomeScreenBody extends StatelessWidget {
  const LoadingHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(color: AppColors.white),
    );
  }
}
