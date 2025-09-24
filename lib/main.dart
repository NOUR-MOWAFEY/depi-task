import 'package:depi_task/cubits/popular_cubit/cubit/popular_cubit.dart';
import 'package:depi_task/screens/home_screen.dart';
import 'package:depi_task/screens/login_screen.dart';
import 'package:depi_task/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme(),
        home: const LoginScreen(),
      ),
    );
  }

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
}
