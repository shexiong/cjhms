
///
/// @author She xiong
/// 创建日期：2019/3/26
/// 描述： 常量
///
///
class Constant {

  static const String BASE_USER_URL = "https://dev-cjyun-api.ecaicn.com/";   ///  登录base
  static const String BASE_DATA_URL = "https://dev-cjhms-api.ecaicn.com/";   ///  课业数据base
  static const String NEED_TOKEN_FIELD = "need_token";
  static const int STATUS_SUCCESS = 0;
  static const String IconFontFamily = "appIconFonts";

  ///  SP存储的key(是否已登录)
  static const String IS_LOGIN = "is_login";

  ///  登录字段
  static const String LOGIN_ACCOUNT = "account";
  static const String PASSWORD = "password";

  ///  绑定手机号短信验证
  static const String LOGIN_PHONE = "bind_phone";
  static const String LOGIN_SMS_MESSAGE = "sms_message";

  ///  验证用于重置密码的短信验证码
  static const String MOBILE = "mobile";
  static const String VERIFY_FORGET_VERIFY_CODE = "code";

  ///  重置密码
  static const String RESET_NEW_PASSWORD = "reset_new_password";
  static const String RESET_CHECK_NEW_PASSWORD = "reset_check_new_password";

}
