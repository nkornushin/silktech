import 'package:json_annotation/json_annotation.dart';
import 'package:silktech_users/features/users/data/models/user_dto.dart';

part 'user_data_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class UserDataDto {
  UserDataDto({
    required this.user,
  });

  @JsonKey(name: 'data')
  final UserDto user;

  factory UserDataDto.fromJson(Map<String, dynamic> json) =>
      _$UserDataDtoFromJson(json);
}
