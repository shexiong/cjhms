
import 'package:cjhms/component/login/entity/current_user_detail.dart';

///   全局变量
class Global{

  static String mobile = '';
  static String verifySmsCode = '';

  ///  是否需要鉴权
  static bool needAuth = false;
  ///  获取当前用户信息并设为全局
  static CurrentUserDetail userDetail = CurrentUserDetail.fromJson({});

}