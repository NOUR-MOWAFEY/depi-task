import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    fontFamily: 'Exo2',
    // brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        fontFamily: 'Exo2',
      ),
    ),
  );
}
