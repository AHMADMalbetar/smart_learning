// To parse this JSON data, do
//
//     final loginRegisterResponse = loginRegisterResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_register_response.freezed.dart';
part 'login_register_response.g.dart';

LoginRegisterResponse loginRegisterResponseFromJson(String str) => LoginRegisterResponse.fromJson(json.decode(str));

String loginRegisterResponseToJson(LoginRegisterResponse data) => json.encode(data.toJson());

@freezed
class LoginRegisterResponse with _$LoginRegisterResponse {
  const factory LoginRegisterResponse({
    @JsonKey(name: "message")
    String? message,
    @JsonKey(name: "data")
    Data? data,
  }) = _LoginRegisterResponse;

  factory LoginRegisterResponse.fromJson(Map<String, dynamic> json) => _$LoginRegisterResponseFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    @JsonKey(name: "user")
    User? user,
    @JsonKey(name: "token")
    String? token,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: "id")
    int? id,
    @JsonKey(name: "name")
    String? name,
    @JsonKey(name: "email")
    String? email,
    @JsonKey(name: "age")
    int? age,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
