// To parse this JSON data, do
//
//     final postScoreResponse = postScoreResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_score_response.freezed.dart';
part 'post_score_response.g.dart';

PostScoreResponse postScoreResponseFromJson(String str) => PostScoreResponse.fromJson(json.decode(str));

String postScoreResponseToJson(PostScoreResponse data) => json.encode(data.toJson());

@freezed
class PostScoreResponse with _$PostScoreResponse {
  const factory PostScoreResponse({
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    Data? data,
  }) = _PostScoreResponse;

  factory PostScoreResponse.fromJson(Map<String, dynamic> json) => _$PostScoreResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "userId")
    int? userId,
    @JsonKey(name: "typeId")
    int? typeId,
    @JsonKey(name: "iq")
    int? iq,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "updated_at")
    String? updatedAt,
    @JsonKey(name: "created_at")
    String? createdAt,
    @JsonKey(name: "id")
    int? id,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
