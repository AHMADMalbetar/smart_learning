// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_smart_level_exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSmartLevelExamResponseImpl _$$GetSmartLevelExamResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSmartLevelExamResponseImpl(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetSmartLevelExamResponseImplToJson(
        _$GetSmartLevelExamResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['id'] as int?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      img: json['img'] as String?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'img': instance.img,
      'choices': instance.choices,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      id: json['id'] as int?,
      description: json['description'] as String?,
      img: json['img'] as String?,
      istrue: json['istrue'] as bool?,
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'img': instance.img,
      'istrue': instance.istrue,
    };
