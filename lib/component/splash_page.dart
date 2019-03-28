import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/component/login/ui/router_login_page.dart';
import 'package:cjhms/component/router_home_page.dart';
import 'package:cjhms/utils/dio_util.dart';
import 'package:cjhms/utils/navigator_util.dart';
import 'package:cjhms/utils/screen_util.dart';
import 'package:cjhms/utils/sp_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 启动页
///
///
class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  ///  是否已登录过
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    _init();
    _initAsync();
    getUserInfo();
    var _duration = new Duration(seconds: 3);
    ///  延时3秒
    new Future.delayed(_duration, go2NextPage);
  }

  ///  单例dio初始化
  void _init() {
    DioUtil.openDebug();   ///  开启debug模式
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.BASE_USER_URL;
    DioUtil.getInstance().setConfig(new HttpConfig(options: options));
  }

  void _initAsync() async {
    await SpUtil.getInstance(); ///  SP初始化
  }

  ///  去拿本地存储的用户信息
  Future getUserInfo() async {
    String account = SpUtil.getString(Constant.SP_USER_ACCOUNT);
    String password = SpUtil.getString(Constant.SP_USER_PASSWORD);
    if (null != account && account.length > 0
        && null != password && password.length > 0) {
      //  去自动登录
      loggedIn = true;
    }
  }

  void go2NextPage() {
    //  在这里判断去主界面还是登录页面
    if (loggedIn) {
      NavigatorUtil.pushPage(context, HomePage());
    } else {
      NavigatorUtil.pushPage(context, new BlocProvider<LoginBloc>(child: LoginPage(),bloc: new LoginBloc(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    // 设置适配尺寸 (填入设计稿中设备的屏幕尺寸)，
    // 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)
      ..init(context);

    return new Scaffold(
      body: new Container(
        child: new Image.asset(
          Utils.getImgPath('launch_screen'),
          fit: BoxFit.fill,
          width: ScreenUtil.screenWidthDp,
          height: ScreenUtil.screenHeightDp,
        ),
      ),
    );
  }
}