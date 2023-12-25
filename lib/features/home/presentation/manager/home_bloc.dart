import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:webtask/core/enums/enums.dart';
import 'package:webtask/features/home/domain/entities/news_entity.dart';
import 'package:webtask/features/home/domain/use_cases/get_all_news_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllNewsUseCase getAllNewsUseCase;
  HomeBloc(this.getAllNewsUseCase) : super(const HomeState()) {
    on<GetAllNewsEvent>(_getAllNews);
  }

  FutureOr<void> _getAllNews(
      GetAllNewsEvent event, Emitter<HomeState> emit) async {
    final result = await getAllNewsUseCase.call();
    result.fold(
        (leftFailure) => emit(state.copyWith(
            getAllNewsState: RequestState.error,
            getAllNewsMessage: leftFailure.message)),
        (rightAllNews) => emit(state.copyWith(
              newsList: rightAllNews,
              getAllNewsState: RequestState.loaded,
            )));
    emit(state.copyWith(
      getAllNewsState: RequestState.idle,
    ));
  }
}
