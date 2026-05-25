import 'package:json_annotation/json_annotation.dart';
import 'user_dto.dart';

part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  final bool success;
  final String message;
  final UserDto? result;

  ProfileResponseDto({
    required this.success,
    required this.message,
    this.result,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) => _$ProfileResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseDtoToJson(this);
}
