import 'package:json_annotation/json_annotation.dart';

part 'current_user_detail.g.dart';


@JsonSerializable()
class CurrentUserDetail extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'schoolId')
  String schoolId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'nickName')
  String nickName;

  @JsonKey(name: 'realName')
  String realName;

  @JsonKey(name: 'currentRole')
  String currentRole;

  @JsonKey(name: 'lastLogin')
  String lastLogin;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'idcard')
  String idcard;

  @JsonKey(name: 'mobile')
  String mobile;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'idcardVerified')
  int idcardVerified;

  @JsonKey(name: 'mobileVerified')
  int mobileVerified;

  @JsonKey(name: 'emailVerified')
  int emailVerified;

  @JsonKey(name: 'birthDate')
  String birthDate;

  @JsonKey(name: 'deviceMac')
  String deviceMac;

  @JsonKey(name: 'qq')
  String qq;

  @JsonKey(name: 'wechat')
  String wechat;

  @JsonKey(name: 'homeAddress')
  String homeAddress;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'roles')
  List<String> roles;

  @JsonKey(name: 'number')
  String number;

  @JsonKey(name: 'schoolName')
  String schoolName;

  CurrentUserDetail(this.id,this.type,this.schoolId,this.userName,this.nickName,this.realName,this.currentRole,
      this.lastLogin,this.gender,this.idcard,this.mobile,this.email,this.idcardVerified,this.mobileVerified,this.emailVerified,
      this.birthDate,this.deviceMac,this.qq,this.wechat,this.homeAddress,this.avatarUrl,this.roles,this.number,this.schoolName,);

  factory CurrentUserDetail.fromJson(Map<String, dynamic> srcJson) => _$CurrentUserDetailFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CurrentUserDetailToJson(this);

}


