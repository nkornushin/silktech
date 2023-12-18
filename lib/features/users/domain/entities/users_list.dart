import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:silktech_users/features/users/domain/entities/user.dart';

part 'users_list.freezed.dart';

@freezed
class UsersList with _$UsersList {
  const factory UsersList({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    required List<User> items,
  }) = _UsersList;
}
