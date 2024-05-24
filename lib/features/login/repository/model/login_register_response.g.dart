// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginRegisterResponseImpl _$$LoginRegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginRegisterResponseImpl(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginRegisterResponseImplToJson(
        _$LoginRegisterResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      iqQuiz: json['IqQuiz'] as bool?,
      learningQuiz: json['LearningQuiz'] as bool?,
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'IqQuiz': instance.iqQuiz,
      'LearningQuiz': instance.learningQuiz,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'age': instance.age,
    };
