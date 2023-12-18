import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:silktech_users/features/users/data/models/user_data_dto.dart';
import 'package:silktech_users/features/users/data/models/users_list_dto.dart';

part 'users_api_service.g.dart';

@RestApi()
abstract class UsersApiService {
  factory UsersApiService(Dio dio) = _UsersApiService;

  @GET('/users')
  Future<UsersListDto> getUsers({
    @Query('page') int page = 1,
    @Query('per_page') int perPage = 10,
  });

  @GET('/users/{id}')
  Future<UserDataDto> getUser(@Path('id') int id);
}
