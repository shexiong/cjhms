
import 'dart:async';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/entity/current_user_detail.dart';
import 'package:cjhms/component/login/entity/user_token_info.dart';
import 'package:cjhms/component/login/repository/repository_login.dart';
import 'package:cjhms/utils/global.dart';
import 'package:rxdart/rxdart.dart';

///
/// @author She xiong
/// 创建日期：2019/3/26
/// 描述：  登录bloc，用于状态管理，将业务逻辑与页面显示分离
///
///
class LoginBloc implements BlocBase{

  ///  rxdart的BehaviorSubject，缓存最新一次事件的广播流控制器
  ///------------------------------   login    ------------------------------- ///
  BehaviorSubject<Map<String, String>> accountOrPasswordSubject = BehaviorSubject<Map<String, String>>();
  Stream<Map<String, String>> get accountOrPasswordStream => accountOrPasswordSubject.stream;
  BehaviorSubject<bool> passwordVisiableSubject = BehaviorSubject<bool>();
  Stream<bool> get passwordVisiableStream => passwordVisiableSubject.stream;

  ///------------------------------   bind phone    ------------------------------- ///
  Timer _timer;
  BehaviorSubject<Map<String, String>> phoneAndSmsSubject = BehaviorSubject<Map<String, String>>();
  Stream<Map<String, String>> get phoneAndSmsStream => phoneAndSmsSubject.stream;
  BehaviorSubject<String> bindPhoneVerifyCodeSubject = BehaviorSubject<String>();
  Stream<String> get bindPhoneVerifyCodeStream => bindPhoneVerifyCodeSubject.stream;

  ///------------------------------   forget password    ------------------------------- ///
  BehaviorSubject<String> forgetPasswordVerifyCodeSubject = BehaviorSubject<String>();
  Stream<String> get forgetPasswordVerifyCodeStream => forgetPasswordVerifyCodeSubject.stream;
  BehaviorSubject<String> resetPasswordSubject = BehaviorSubject<String>();
  Stream<String> get resetPasswordStream => resetPasswordSubject.stream;

  LoginRepository repository = new LoginRepository();

  @override
  void dispose() {
    _timer.cancel();
    accountOrPasswordSubject.close();
    passwordVisiableSubject.close();
    phoneAndSmsSubject.close();
    bindPhoneVerifyCodeSubject.close();
    forgetPasswordVerifyCodeSubject.close();
    resetPasswordSubject.close();
  }

  ///  异步登录
  Future loginToYun(String account, String password) async{
    bool loginResponse = await repository.loginToYun(account, password);
    return loginResponse;
  }

  void accountOrPasswordChange(Map<String, String> map){
    accountOrPasswordSubject.sink.add(map);
  }

  void passwordVisiableChange(bool isVisiable){
    passwordVisiableSubject.sink.add(isVisiable);
  }

  void phoneAndSmsChange(Map<String, String> map){
    phoneAndSmsSubject.sink.add(map);
  }

  ///   绑定手机时去获取验证码，并开始倒计时
  void bindPhoneVerifyCode(){
    _startTimer(0);

  }

  ///   重置密码时获取验证码，并开始倒计时
  Future<bool> sendForgetVerifyCode(String phone) async{
    _startTimer(1);
    return await repository.sendForgetVerifyCode(phone);
  }

  ///   重置密码时去验证验证码
  Future<bool> verifyForgetVerifyCode(String phone, String verifyCode) async{
    Global.mobile = phone;
    Global.verifySmsCode = verifyCode;
    return await repository.verifyForgetVerifyCode(phone, verifyCode);
  }

  ///   重置密码
  Future<bool> resetPassword(String password) async{
    return await repository.resetForgetPassword(Global.mobile, password, Global.verifySmsCode);
  }

  ///  得到当前用户信息
  Future<CurrentUserDetail> getCurrentUser() async{
    return await repository.getCurrentUser();
  }

  Future refreshToken() async{
    bool refresh = await repository.refreshToken();
    return refresh;
  }

  ///  刷新token
  Future getAchieveReportData() async{
    bool haveData = await repository.getAchieveReportData();
    return haveData;
  }




  ///   定时器
  _startTimer(int type){
    int seconds = 60;
    String verifyStr;
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        _cancelTimer();
        return;
      }
      seconds--;
      verifyStr = '重新发送($seconds)';
      if (seconds == 0) {
        verifyStr = '获取验证码';
      }
      switch(type){
        case 0:
          bindPhoneVerifyCodeSubject.sink.add(verifyStr);
          break;
        case 1:
          forgetPasswordVerifyCodeSubject.sink.add(verifyStr);
          break;
        default:
          break;
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

}