import 'package:depi_task/screens/login_screen.dart';
import 'package:depi_task/utils/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.white),
          toolbarHeight: 60,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontFamily: 'Exo2',
          ),
        ),
      ),

      home: LoginScreen(),
    );
  }
}
