
import '../helper/animation.dart';
import '../screens/login_screen.dart';
import 'package:flutter/material.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          CustomAnimation.createRouteForFadeTransition(LoginScreen()),
          (route) => false,
        );
      },
      icon: Icon(Icons.logout),
    );
  }
}
