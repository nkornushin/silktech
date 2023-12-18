import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buttons_state.dart';
part 'buttons_cubit.freezed.dart';

class ButtonsCubit extends Cubit<ButtonsState> {
  ButtonsCubit() : super(const ButtonsState());

  void isAllowSearch(bool allow) {
    emit(state.copyWith(
      allowSearch: allow,
    ));
  }
}
