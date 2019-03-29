import 'package:json_annotation/json_annotation.dart';

part 'response_login.g.dart';

///   登录response
@JsonSerializable()
class LoginResponse extends Object{

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'expiresIn')
  int expiresIn;

  @JsonKey(name: 'expiresAt')
  String expiresAt;

  LoginResponse(this.token,this.expiresIn,this.expiresAt);

  factory LoginResponse.fromJson(Map<String, dynamic> srcJson) => _$LoginResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}


