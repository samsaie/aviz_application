part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  final Either<String, List<Promotion>> hotPromotions;
  final Either<String, List<Promotion>> latestPromotions;

  HomeRequestSuccessState(
      {required this.hotPromotions, required this.latestPromotions});
}

class HomeLoadingState extends HomeState {}
