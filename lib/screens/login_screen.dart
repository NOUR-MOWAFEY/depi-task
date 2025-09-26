import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.message});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  final String? message;
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
            exception: state.msg,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: LoginScreenBody(
          message: widget.message,
          emailController: emailController,
          passwordController: passwordController,
          loginKey: loginKey,
        ),
      ),
    );
  }
}
