import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silktech_users/core/errors/failure.dart';
import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/domain/usecases/get_users_list_usecase.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';
part 'users_list_bloc.freezed.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc(this._usecase)
      : _page = 1,
        _users = [],
        super(const _Initial()) {
    on<_GetUsers>(_onGetUsers);
    on<_RefreshUsers>(_onRefreshUsers);
  }

  final GetUsersListUseCase _usecase;
  int _page;
  final List<User> _users;

  void _onRefreshUsers(
    UsersListEvent event,
    Emitter<UsersListState> emit,
  ) async {
    _page = 1;
    _users.clear();
    add(const UsersListEvent.getUsers());
  }

  void _onGetUsers(
    UsersListEvent event,
    Emitter<UsersListState> emit,
  ) async {
    bool isInitial = _page == 1;

    emit(isInitial
        ? const UsersListState.loading()
        : UsersListState.success(
            users: _users,
            isLoading: true,
          ));

    final dataState = await _usecase(
        params: GetUsersListUseCaseParams(
      page: _page,
      perPage: 10,
    ));

    if (dataState is DataSuccess && dataState.data != null) {
      _users.addAll(dataState.data!.items);
      _page = dataState.data!.page + 1;
      emit(
        UsersListState.success(
          users: _users,
          isNextPageExists: _page <= dataState.data!.totalPages,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(
        UsersListState.error(
          (dataState.error as ServerFailure).message ?? 'Error',
        ),
      );
    }
  }
}
