import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required int id,
    required String name,
    required String email,
    required String gender,
    String? dateOfBirth,
    int? points,
    String? avatarUrl,
  }) = _UserEntity;
}
