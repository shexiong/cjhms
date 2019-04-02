// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUserDetail _$CurrentUserDetailFromJson(Map<String, dynamic> json) {
  return CurrentUserDetail(
      json['id'] as String,
      json['type'] as int,
      json['schoolId'] as String,
      json['userName'] as String,
      json['nickName'] as String,
      json['realName'] as String,
      json['currentRole'] as String,
      json['lastLogin'] as String,
      json['gender'] as int,
      json['idcard'] as String,
      json['mobile'] as String,
      json['email'] as String,
      json['idcardVerified'] as int,
      json['mobileVerified'] as int,
      json['emailVerified'] as int,
      json['birthDate'] as String,
      json['deviceMac'] as String,
      json['qq'] as String,
      json['wechat'] as String,
      json['homeAddress'] as String,
      json['avatarUrl'] as String,
      (json['roles'] as List)?.map((e) => e as String)?.toList(),
      json['number'] as String,
      json['schoolName'] as String);
}

Map<String, dynamic> _$CurrentUserDetailToJson(CurrentUserDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'schoolId': instance.schoolId,
      'userName': instance.userName,
      'nickName': instance.nickName,
      'realName': instance.realName,
      'currentRole': instance.currentRole,
      'lastLogin': instance.lastLogin,
      'gender': instance.gender,
      'idcard': instance.idcard,
      'mobile': instance.mobile,
      'email': instance.email,
      'idcardVerified': instance.idcardVerified,
      'mobileVerified': instance.mobileVerified,
      'emailVerified': instance.emailVerified,
      'birthDate': instance.birthDate,
      'deviceMac': instance.deviceMac,
      'qq': instance.qq,
      'wechat': instance.wechat,
      'homeAddress': instance.homeAddress,
      'avatarUrl': instance.avatarUrl,
      'roles': instance.roles,
      'number': instance.number,
      'schoolName': instance.schoolName
    };
