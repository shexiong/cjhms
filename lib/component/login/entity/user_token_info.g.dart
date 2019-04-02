// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenInfo _$UserTokenInfoFromJson(Map<String, dynamic> json) {
  return UserTokenInfo(json['token'] as String, json['expiresIn'] as int,
      json['expiresAt'] as String);
}

Map<String, dynamic> _$UserTokenInfoToJson(UserTokenInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresIn': instance.expiresIn,
      'expiresAt': instance.expiresAt
    };
