import '../cubits/auth_cubit/auth_cubit.dart';
import '../cubits/popular_cubit/popular_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import '../widgets/loading_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial || state is AuthLoading) {
          return const Scaffold(body: LoadingHomeScreenBody());
        }
        if (state is AuthAuthenticated) {
          return BlocProvider(
            create: (context) => PopularCubit(),
            child: const HomeScreen(),
          );
        } else {
          final msg = state is AuthUnAuthenticated ? state.msg : null;
          return LoginScreen(message: msg);
        }
      },
      listener: (BuildContext context, AuthState state) {
        if (state is AuthUnAuthenticated && state.msg != null) {
          showSnackBar(
            context: context,
            color: Colors.red,
            exception: state.msg.toString(),
          );
        }
      },
    );
  }
}
