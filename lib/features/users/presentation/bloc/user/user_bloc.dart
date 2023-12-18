import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silktech_users/core/errors/failure.dart';
import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/domain/usecases/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._usecase) : super(const _Initial()) {
    on<_GetUser>(_onGetUser);
  }

  final GetUserUseCase _usecase;

  void _onGetUser(
    UserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(const UserState.loading());

      final dataState = await _usecase(params: event.id);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(UserState.success(user: dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(
          UserState.error(
            (dataState.error as ServerFailure).message ?? 'Error',
          ),
        );
      }
    } catch (message) {
      emit(
        UserState.error(
          message.toString(),
        ),
      );
    }
  }
}
