import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class UserDto {
  UserDto({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  @JsonKey(name: 'avatar')
  final String picture;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}
