import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../data/model/promotion.dart';
import '../data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeInitialState()) {
    on<HomeGetInitializeData>((event, emit) async {
      emit(HomeLoadingState());
      var hotPromotionList = await homeRepository.getHotPromotion();
      var latestPromotionList = await homeRepository.getLatestPromotion();

      emit(HomeRequestSuccessState(
          hotPromotions: hotPromotionList,
          latestPromotions: latestPromotionList));
    });
  }
}
