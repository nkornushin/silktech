part of 'users_list_bloc.dart';

@freezed
class UsersListEvent with _$UsersListEvent {
  const factory UsersListEvent.getUsers() = _GetUsers;
  const factory UsersListEvent.refreshUsers() = _RefreshUsers;
}
