import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth_cubit/auth_cubit.dart';
import '../helper/animation.dart';
import '../screens/login_screen.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await BlocProvider.of<AuthCubit>(context).signOut();
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            CustomAnimation.createRouteForFadeTransition(LoginScreen()),
            (route) => false,
          );
        }
      },
      icon: Icon(Icons.logout),
    );
  }
}
