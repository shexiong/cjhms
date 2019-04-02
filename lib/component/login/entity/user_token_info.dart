import 'package:json_annotation/json_annotation.dart';

part 'user_token_info.g.dart';

///   登录token
@JsonSerializable()
class UserTokenInfo extends Object{

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'expiresIn')
  int expiresIn;

  @JsonKey(name: 'expiresAt')
  String expiresAt;

  UserTokenInfo(this.token,this.expiresIn,this.expiresAt);

  factory UserTokenInfo.fromJson(Map<String, dynamic> srcJson) => _$UserTokenInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserTokenInfoToJson(this);

}


