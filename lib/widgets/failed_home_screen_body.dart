import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomeScreenFailedBody extends StatelessWidget {
  const HomeScreenFailedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Something went wrong',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
