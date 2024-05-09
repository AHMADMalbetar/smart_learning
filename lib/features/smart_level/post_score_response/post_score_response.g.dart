// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostScoreResponseImpl _$$PostScoreResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PostScoreResponseImpl(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostScoreResponseImplToJson(
        _$PostScoreResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      userId: json['userId'] as int?,
      typeId: json['typeId'] as int?,
      iq: json['iq'] as int?,
      name: json['name'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'typeId': instance.typeId,
      'iq': instance.iq,
      'name': instance.name,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
