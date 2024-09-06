import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    // on<HomeInitialEvent>(_onHomeInitialEvent);
  }

  // void _onHomeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
  //   emit(state.copyWith(statusLoading: StatusLoading.loading));
  //   await Future.delayed(const Duration(seconds: 2));
  //   emit(state.copyWith(
  //       statusLoading: StatusLoading.success, message: Random().nextInt(100).toString()));
  //   await Future.delayed(const Duration(seconds: 5));
  //   emit(state.copyWith(statusLoading: StatusLoading.error, message: 'Lỗi init'));
  // }
}

extension HomeBlocEx on BuildContext {
  HomeBloc get homeBloc => read<HomeBloc>();
}
