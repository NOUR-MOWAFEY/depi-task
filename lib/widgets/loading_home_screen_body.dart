import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingHomeScreenBody extends StatelessWidget {
  const LoadingHomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const CircularProgressIndicator(color: AppColors.white),
    );
  }
}
