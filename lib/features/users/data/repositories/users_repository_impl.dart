import 'package:dio/dio.dart';
import 'package:silktech_users/core/errors/failure.dart';
import 'package:silktech_users/core/resources/data_state.dart';
import 'package:silktech_users/features/users/data/datasources/remote/users_api_service.dart';
import 'package:silktech_users/features/users/data/models/user_data_dto.dart';
import 'package:silktech_users/features/users/data/models/users_list_dto.dart';
import 'package:silktech_users/features/users/data/repositories/mappers/user_mapper.dart';
import 'package:silktech_users/features/users/data/repositories/mappers/users_list_mapper.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';
import 'package:silktech_users/features/users/domain/entities/users_list.dart';
import 'package:silktech_users/features/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersApiService service;

  UsersRepositoryImpl({required this.service});

  @override
  Future<DataState<User>> getUserDetails(int id) async {
    try {
      UserDataDto userData = await service.getUser(id);

      return DataSuccess(
        UserMapper.toEntity(userData.user),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return DataFailed(
          ServerFailure(
            message: 'User not found',
          ),
        );
      }

      return DataFailed(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<DataState<UsersList>> getUsers(int page, int perPage) async {
    try {
      UsersListDto usersList = await service.getUsers(
        page: page,
        perPage: perPage,
      );

      return DataSuccess(
        UsersListMapper.toEntity(usersList),
      );
    } on DioException catch (e) {
      return DataFailed(
        ServerFailure(
          message: e.message,
        ),
      );
    }
  }
}
