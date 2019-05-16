
///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： Api集中管理
///
///
class Api {

  ///  用户登录
  static const String USER_LOGIN = "api/auth/login";

  ///  获取当前登录用户的信息
  static const String CURRENT_USER_DETAIL = "api/user";

  ///  刷新当前登录用户的Token
  static const String REFRESH_TOKEN = "api/auth/refresh-token";

  ///  发送用于重置密码的短信验证码
  static const String SEND_FORGET_VERIFY_CODE = "api/password-reset/sms-code/send";

  ///  验证用于重置密码的短信验证码
  static const String VERIFY_FORGET_VERIFY_CODE = "api/password-reset/sms-code/verify";

  ///  重置密码
  static const String RESET_FORGET_PASSWORD = "api/password-reset/sms-code/reset-password";

  ///  获取首页比赛报告(战绩播报数据)
  static const String ACHIEVE_REPORT = "app/api/game/report";

  ///  获取战绩播报详情
  static const String ACHIEVE_REPORT_DETAIL = "app/api/game/student/detail/";

  ///  获取学生作业列表
  static const String HOMEWORK_LIST_DATA = "app/api/student/homeworks/history";


}