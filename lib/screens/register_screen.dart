import '../widgets/loading_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../utils/app_strings.dart';
import '../widgets/register_screen_body.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
  static String? message;
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.register)),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, AuthState state) {
          context.read<AuthCubit>().onRegisterCompleted(state, context);
        },
        builder: (context, state) {
          return state is AuthLoading
              ? LoadingScreenBody()
              : RegisterScreenBody(
                  emailController: emailController,
                  passwordController: passwordController,
                  registerKey: registerKey,
                );
        },
      ),
    );
  }
}
