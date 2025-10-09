import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingScreenBody extends StatelessWidget {
  const LoadingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircularProgressIndicator(color: AppColors.white),
      ),
    );
  }
}
