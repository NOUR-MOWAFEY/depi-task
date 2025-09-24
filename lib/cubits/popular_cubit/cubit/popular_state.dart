part of 'popular_cubit.dart';

@immutable
sealed class PopularState {
  get popular => null;
}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  @override
  final PopularModel? popular;

  PopularSuccess({required this.popular});
}

final class PopularFailed extends PopularState {}
