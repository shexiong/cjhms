
///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： Api集中管理
///
///
class Api {

  ///  用户登录
  static const String USER_LOGIN = "api/auth/login";

  ///  发送用于重置密码的短信验证码
  static const String SEND_FORGET_VERIFY_CODE = "/api/password-reset/sms-code/send";

  ///  验证用于重置密码的短信验证码
  static const String VERIFY_FORGET_VERIFY_CODE = "/api/password-reset/sms-code/verify";

  ///  重置密码
  static const String RESET_FORGET_PASSWORD = "/api/password-reset/sms-code/reset-password";


}