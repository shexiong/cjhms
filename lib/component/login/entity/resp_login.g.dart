// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(json['token'] as String, json['expiresIn'] as int,
      json['expiresAt'] as String);
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresIn': instance.expiresIn,
      'expiresAt': instance.expiresAt
    };
