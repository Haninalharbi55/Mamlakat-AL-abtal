import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_entity.freezed.dart';

enum RegionStatus {
  locked,
  unlocked,
  completed,
}

@freezed
class RegionEntity with _$RegionEntity {
  const factory RegionEntity({
    required int id,
    required String name,
    required String nameEn,
    required String description,
    required RegionStatus status,
    required String image,
  }) = _RegionEntity;
}
