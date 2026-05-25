import 'package:json_annotation/json_annotation.dart';

part 'region_dto.g.dart';

@JsonSerializable()
class RegionDto {
  final int id;
  final String name;
  @JsonKey(name: 'nameEn')
  final String nameEn;
  final String description;
  final String status;
  final String image;

  RegionDto({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.description,
    required this.status,
    required this.image,
  });

  factory RegionDto.fromJson(Map<String, dynamic> json) =>
      _$RegionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegionDtoToJson(this);
}
