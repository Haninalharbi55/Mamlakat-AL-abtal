import 'package:json_annotation/json_annotation.dart';
import 'user_dto.dart';

part 'auth_dto.g.dart';

@JsonSerializable()
class AuthDto {
  final bool success;
  final String message;
  final AuthResultDto? result;

  AuthDto({
    required this.success,
    required this.message,
    this.result,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) => _$AuthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);
}

@JsonSerializable()
class AuthResultDto {
  final String? token;
  final String? role;

  AuthResultDto({
    this.token,
    this.role,
  });

  factory AuthResultDto.fromJson(Map<String, dynamic> json) => _$AuthResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResultDtoToJson(this);
}
