// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionDto _$RegionDtoFromJson(Map<String, dynamic> json) => RegionDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameEn: json['nameEn'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$RegionDtoToJson(RegionDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameEn': instance.nameEn,
      'description': instance.description,
      'status': instance.status,
      'image': instance.image,
    };
