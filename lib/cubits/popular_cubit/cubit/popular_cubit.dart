import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:depi_task/models/popular_model.dart';
import 'package:depi_task/services/popular_service.dart';
import 'package:meta/meta.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  getData() async {
    emit(PopularLoading());

    try {
      PopularModel? popular = await PopularService().getAllPopulars();
      emit(PopularSuccess(popular: popular));
    } catch (e) {
      log(e.toString());
      emit(PopularFailed());
    }
  }
}
