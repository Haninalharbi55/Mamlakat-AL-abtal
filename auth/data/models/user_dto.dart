import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final int id;
  final String name;
  final String email;
  final String gender;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  final int? points;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    this.dateOfBirth,
    this.points,
    this.avatarUrl,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
