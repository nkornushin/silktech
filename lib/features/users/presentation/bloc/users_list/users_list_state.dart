part of 'users_list_bloc.dart';

@freezed
class UsersListState with _$UsersListState {
  const factory UsersListState.initial() = _Initial;
  const factory UsersListState.loading() = _Loading;
  const factory UsersListState.success({
    required List<User> users,
    @Default(false) bool isLoading,
    @Default(true) bool isNextPageExists,
  }) = _Success;
  const factory UsersListState.error(String message) = _ErrorState;
}
