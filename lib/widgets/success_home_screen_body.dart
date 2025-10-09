import 'package:depi_task/screens/profile_screen.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/widgets/exit_icon.dart';
import 'package:flutter/material.dart';

import '../cubits/popular_cubit/popular_cubit.dart';
import 'home_container.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.state});
  final PopularState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(Icons.person),
        ),
        title: Text(AppStrings.home),
        actions: [ExitIcon(), SizedBox(width: 6)],
      ),

      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 4),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.1, end: 1.0),
              duration: const Duration(seconds: 1),
              builder: (BuildContext context, value, Widget? child) {
                return Opacity(
                  opacity: value,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: PopularItem(
                      name: state.popular?.results?[index].name,
                      description:
                          state.popular?.results?[index].knownFor?[0].overview,
                    ),
                  ),
                );
              },
            );
          },
          itemCount: state.popular?.results?.length ?? 0,
        ),
      ),
    );
  }
}
