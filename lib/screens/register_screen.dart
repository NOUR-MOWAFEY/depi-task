import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../utils/app_strings.dart';
import '../widgets/loading_home_screen_body.dart';
import '../widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              : RegisterScreenBody();
        },
      ),
    );
  }
}
