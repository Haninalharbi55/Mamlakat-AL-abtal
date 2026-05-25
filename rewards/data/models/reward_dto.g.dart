// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardDto _$RewardDtoFromJson(Map<String, dynamic> json) => RewardDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      titleEn: json['titleEn'] as String,
      earned: json['earned'] as bool,
      earnedDate: json['earnedDate'] as String?,
    );

Map<String, dynamic> _$RewardDtoToJson(RewardDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleEn': instance.titleEn,
      'earned': instance.earned,
      'earnedDate': instance.earnedDate,
    };
