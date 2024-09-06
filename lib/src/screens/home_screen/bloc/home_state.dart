import 'package:base_flutter_app/src/datas/enums/status_loading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(StatusLoading.initial) StatusLoading statusLoading,
    @Default('') String message,
  }) = _HomeState;
}
