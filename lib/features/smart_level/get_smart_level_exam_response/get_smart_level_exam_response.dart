// To parse this JSON data, do
//
//     final getSmartLevelExamResponse = getSmartLevelExamResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_smart_level_exam_response.freezed.dart';
part 'get_smart_level_exam_response.g.dart';

GetSmartLevelExamResponse getSmartLevelExamResponseFromJson(String str) => GetSmartLevelExamResponse.fromJson(json.decode(str));

String getSmartLevelExamResponseToJson(GetSmartLevelExamResponse data) => json.encode(data.toJson());

@freezed
class GetSmartLevelExamResponse with _$GetSmartLevelExamResponse {
  const factory GetSmartLevelExamResponse({
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    List<Datum>? data,
  }) = _GetSmartLevelExamResponse;

  factory GetSmartLevelExamResponse.fromJson(Map<String, dynamic> json) => _$GetSmartLevelExamResponseFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "title")
    String? title,
    @JsonKey(name: "category")
    String? category,
    @JsonKey(name: "img")
    String? img,
    @JsonKey(name: "choices")
    List<Choice>? choices,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "description")
    String? description,
    @JsonKey(name: "img")
    String? img,
    @JsonKey(name: "istrue")
    bool? istrue,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}
