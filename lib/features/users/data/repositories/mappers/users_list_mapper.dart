import 'package:silktech_users/features/users/data/models/users_list_dto.dart';
import 'package:silktech_users/features/users/data/repositories/mappers/user_mapper.dart';
import 'package:silktech_users/features/users/domain/entities/users_list.dart';

class UsersListMapper {
  static UsersList toEntity(
    UsersListDto model,
  ) {
    return UsersList(
      page: model.page,
      perPage: model.perPage,
      total: model.total,
      totalPages: model.totalPages,
      items: model.items.map((item) => UserMapper.toEntity(item)).toList(),
    );
  }
}
