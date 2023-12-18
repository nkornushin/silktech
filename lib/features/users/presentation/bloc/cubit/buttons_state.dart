part of 'buttons_cubit.dart';

@freezed
class ButtonsState with _$ButtonsState {
  const factory ButtonsState({
    @Default(false) bool allowSearch,
  }) = _ButtonsState;
}
