import 'package:json_annotation/json_annotation.dart';
import 'package:silktech_users/features/users/data/models/user_dto.dart';

part 'users_list_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class UsersListDto {
  UsersListDto({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.items,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  @JsonKey(name: 'data')
  final List<UserDto> items;

  factory UsersListDto.fromJson(Map<String, dynamic> json) =>
      _$UsersListDtoFromJson(json);
}
