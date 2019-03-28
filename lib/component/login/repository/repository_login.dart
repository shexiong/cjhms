
import 'package:cjhms/api/api.dart';
import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/login/entity/resp_login.dart';
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
        data: {Constant.LOGIN_ACCOUNT: account, Constant.LOGIN_PASSWORD: password},
        options: DioUtil.changeBaseUrlOptions(true));

    if (baseResp.code == Constant.STATUS_SUCCESS && baseResp.data.isNotEmpty) {
      ///  将得到的map反序列化为对象
      return LoginResponse.fromJson(baseResp.data);
    }
    return new LoginResponse(null,0,null);
  }



  ///  获取当前用户


}