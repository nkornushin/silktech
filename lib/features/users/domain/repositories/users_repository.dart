import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/domain/entities/users_list.dart';

abstract class UsersRepository {
  Future<DataState<UsersList>> getUsers(int page, int perPage);
  Future<DataState<User>> getUserDetails(int id);
}
