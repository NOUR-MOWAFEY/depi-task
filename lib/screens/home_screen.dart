import 'package:depi_task/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/popular_cubit/popular_cubit.dart';
import '../models/popular_model.dart';
import '../widgets/failed_home_screen_body.dart';
import '../widgets/loading_home_screen_body.dart';
import '../widgets/success_home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PopularModel? popular;
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getpersonalData();
    BlocProvider.of<PopularCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        return switch (state) {
          PopularInitial() => const LoadingScreenBody(),
          PopularLoading() => const LoadingScreenBody(),
          PopularSuccess state => HomeScreenBody(state: state),
          PopularFailed() => const HomeScreenFailedBody(),
        };
        // return Scaffold(

        // );
      },
    );
  }
}
