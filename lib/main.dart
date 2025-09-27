import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth_cubit/auth_cubit.dart';
import 'helper/main_theme.dart';
import 'screens/auth_gate.dart';
import 'services/firebase_service/auth_repo.dart';

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
      create: (context) => AuthCubit(AuthRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme(),
        home: const AuthGate(),
      ),
    );
  }
}
