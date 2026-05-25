// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDto _$AuthDtoFromJson(Map<String, dynamic> json) => AuthDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      result: json['result'] == null
          ? null
          : AuthResultDto.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthDtoToJson(AuthDto instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'result': instance.result,
    };

AuthResultDto _$AuthResultDtoFromJson(Map<String, dynamic> json) =>
    AuthResultDto(
      token: json['token'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$AuthResultDtoToJson(AuthResultDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'role': instance.role,
    };
