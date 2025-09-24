import 'package:depi_task/cubits/popular_cubit/cubit/popular_cubit.dart';
import 'package:depi_task/models/popular_model.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/widgets/failed_home_screen_body.dart';
import 'package:depi_task/widgets/loading_home_screen_body.dart';
import 'package:depi_task/widgets/success_home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PopularModel? popular;
  @override
  void initState() {
    BlocProvider.of<PopularCubit>(context).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(AppStrings.home)),
          body: switch (state) {
            PopularInitial() => const LoadingHomeScreenBody(),
            PopularLoading() => const LoadingHomeScreenBody(),
            PopularSuccess state => SuccessHomeScreenBody(state: state),
            PopularFailed() => const FailedHomeScreenBody(),
          },
        );
      },
    );
  }
}
