import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/register_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_strings.dart';

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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnAuthenticated && state.msg != null) {
          showSnackBar(
            context: context,
            color: Colors.red,
            exception: state.msg.toString(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text(AppStrings.register)),
        body: RegisterScreenBody(
          emailController: emailController,
          passwordController: passwordController,
          registerKey: registerKey,
        ),
      ),
    );
  }
}
