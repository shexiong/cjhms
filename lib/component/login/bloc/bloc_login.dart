import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/entity/resp_login.dart';
import 'package:cjhms/component/login/repository/repository_login.dart';
import 'package:rxdart/rxdart.dart';

///
/// @author She xiong
/// 创建日期：2019/3/26
/// 描述：  登录bloc，用于状态管理，将业务逻辑与页面显示分离
///
///
class LoginBloc implements BlocBase{

  ///  rxdart的类，用于控制输入输出流
  BehaviorSubject<Map<String, String>> accountOrPasswordSubject = BehaviorSubject<Map<String, String>>();
  Stream<Map<String, String>> get accountOrPasswordStream => accountOrPasswordSubject.stream;

  BehaviorSubject<bool> passwordVisiableSubject = BehaviorSubject<bool>();
  Stream<bool> get passwordVisiableStream => passwordVisiableSubject.stream;


  LoginRepository repository = new LoginRepository();

  @override
  void dispose() {
    accountOrPasswordSubject.close();
    passwordVisiableSubject.close();
  }

  @override
  Future onLoadMore() {
    return null;
  }

  @override
  Future onRefresh() {
    return null;
  }

  ///  异步登录
  Future loginToYun(String account, String password) async{
    LoginResponse loginResponse = await repository.loginToYun(account, password);
    return loginResponse;
  }

  void accountOrPasswordChange(Map<String, String> map){
    accountOrPasswordSubject.sink.add(map);
  }

  void passwordVisiableChange(bool isVisiable){
    passwordVisiableSubject.sink.add(isVisiable);
  }

}