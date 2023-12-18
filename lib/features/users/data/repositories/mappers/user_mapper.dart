import 'package:silktech_users/features/users/data/models/user_dto.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';

class UserMapper {
  static User toEntity(
    UserDto model,
  ) {
    return User(
        id: model.id,
        email: model.email,
        firstName: model.firstName,
        lastName: model.lastName,
        picture: model.picture,
        fullName: '${model.firstName} ${model.lastName}');
  }
}
