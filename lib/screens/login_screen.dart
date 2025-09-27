import 'package:flutter/material.dart';

import '../widgets/login_screen_body.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: LoginScreenBody(
        message: widget.message,
        emailController: emailController,
        passwordController: passwordController,
        loginKey: loginKey,
      ),
    );
  }
}
