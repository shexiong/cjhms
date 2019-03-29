
import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/login/entity/response_login.dart';
import 'package:cjhms/utils/dio_util.dart';

///
/// @author She xiong
/// 创建日期：2019/3/26
/// 描述： 登录数据获取类
///
///
class LoginRepository {

  ///  登录云平台
  Future<LoginResponse> loginToYun(String account, String password) async{
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil.getInstance().request<Map<String, dynamic>>(
        Method.post, Api.USER_LOGIN,
        data: {Constant.LOGIN_ACCOUNT: account, Constant.PASSWORD: password},
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data.isNotEmpty) {
      ///  将得到的map反序列化为对象
      return LoginResponse.fromJson(baseResp.data);
    }
    return new LoginResponse('',0,'');
  }


  ///  发送用于重置密码的短信验证码
  Future<bool> sendForgetVerifyCode(String phone) async{
    BaseResp<Map<String, dynamic>> baseResp = await DioUtil.getInstance().request<Map<String, dynamic>>(
        Method.post, Api.SEND_FORGET_VERIFY_CODE,
        data: {Constant.MOBILE: phone},
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS) {
      return true;
    }
    return false;
  }


  /// 验证用于重置密码的短信验证码
  Future<bool> verifyForgetVerifyCode(String phone, String verifyCode) async{
    BaseResp<bool> baseResp = await DioUtil.getInstance().request<bool>(
        Method.post, Api.VERIFY_FORGET_VERIFY_CODE,
        data: {Constant.MOBILE: phone, Constant.VERIFY_FORGET_VERIFY_CODE:verifyCode},
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data) {
      return true;
    }
    return false;
  }

  /// 使用短信验证码来重置密码
  Future<bool> resetForgetPassword(String phone, String password, String verifyCode) async{
    BaseResp<bool> baseResp = await DioUtil.getInstance().request<bool>(
        Method.post, Api.RESET_FORGET_PASSWORD,
        data: {Constant.MOBILE: phone, Constant.PASSWORD: password, Constant.VERIFY_FORGET_VERIFY_CODE:verifyCode},
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS) {
      return true;
    }
    return false;
  }










}