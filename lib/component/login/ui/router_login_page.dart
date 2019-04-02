import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/component/login/entity/user_token_info.dart';
import 'package:cjhms/component/login/ui/router_forget_verify_page.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/global.dart';
import 'package:cjhms/utils/navigator_util.dart';
import 'package:cjhms/utils/sp_util.dart';
import 'package:cjhms/utils/toast_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/dialog/loading_dialog.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 登录页面
///
///
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  LoginBloc bloc;

  ///  编辑栏控制器
  TextEditingController _userPassController = new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  ///  显示明文密码
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    //  监听编辑框文字变化
    _userNameController.addListener(() {
      if (bloc != null) {
        bloc.accountOrPasswordChange({
          Constant.LOGIN_ACCOUNT: _userNameController.text,
          Constant.PASSWORD: _userPassController.text
        });
      }
    });
    _userPassController.addListener(() {
      if (bloc != null) {
        bloc.accountOrPasswordChange({
          Constant.LOGIN_ACCOUNT: _userNameController.text,
          Constant.PASSWORD: _userPassController.text
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _userPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///  拿到bloc
    bloc = BlocProvider.of<LoginBloc>(context);

    return new WillPopScope(
      child: new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildContainerBg,
            getAccountOrPwd("账号"),
            buildAccount,
            getAccountOrPwd("密码"),
            buildPassword,
            buildLogin(),
            buildForget
          ],
        ),
      ),
      //  包一层WillPopScope用来点返回键退出
      onWillPop: _requestPop,
    );
  }

  ///  返回键退出
  Future<bool> _requestPop() {
    if(mContext != null){
      Navigator.pop(mContext);  //  销毁dialog对话框
      mContext = null;
    }else{
      SystemNavigator.pop();
    }
    return new Future.value(false);
  }

  Container get buildContainerBg {
    return new Container(
      height: Dimens.ratio_height_33,
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(Utils.getImgPath('login_bg'),),
            fit: BoxFit.fill,
          )
      ),
    );
  }

  Container get buildAccount {
    return new Container(
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new TextField(
        style: new TextStyle(
            fontSize: Dimens.font_space_15, color: Colors.black),
        controller: _userNameController,
        maxLength: 20,
        decoration: new InputDecoration(
          hintText: "请输入账号",
          counterStyle: TextStyle(color: Colors.transparent),
          contentPadding: EdgeInsets.only(
              top: Dimens.space_width_10, bottom: Dimens.space_width_10),
        ),
        obscureText: false,
      ),
    );
  }

  Container get buildPassword {
    return new Container(
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new StreamBuilder(
        stream: bloc.passwordVisiableStream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (ObjectUtil.isEmpty(snapshot.data)) {
            return getTextField(false);
          }
          return getTextField(snapshot.data);
        },
      ),
    );
  }

  TextField getTextField(bool visiable) {
    return new TextField(
      style: new TextStyle(
          fontSize: Dimens.font_space_15, color: Colors.black),
      controller: _userPassController,
      maxLength: 20,
      decoration: new InputDecoration(
          hintText: "请输入密码",
          counterStyle: TextStyle(color: Colors.transparent),
          contentPadding: EdgeInsets.only(
              top: Dimens.space_width_10, bottom: Dimens.space_width_10),
          suffix: new Container(
            width: Dimens.space_width_48, height: Dimens.space_width_32,
            margin: EdgeInsets.only(right: Dimens.space_width_15),
            child: IconButton(
                padding: EdgeInsets.only(right: Dimens.ratio_width_1),
                iconSize: Dimens.space_width_24,
                icon: visiable ? new Icon(IconData(
                  0xe6b0, fontFamily: Constant.IconFontFamily,),
                  size: Dimens.space_width_20,
                  color: ColorT.app_common,) :
                new Icon(IconData(
                  0xe670, fontFamily: Constant.IconFontFamily,),
                  size: Dimens.space_width_20,
                  color: Colors.black26,),
                onPressed: () {
                  showPassword = !showPassword;
                  bloc.passwordVisiableChange(showPassword);
                }
            ),
          )
      ),
      obscureText: !visiable,
    );
  }

  Container getAccountOrPwd(String textStr) {
    return new Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new Text(textStr, style: TextStyle(
          color: Colors.black, fontSize: Dimens.font_space_16),
      ),
    );
  }

  Container buildLogin() {
    return new Container(
      height: Dimens.ratio_width_10,
      margin: EdgeInsets.only(
          top: Dimens.ratio_height_5, left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new StreamBuilder(
        stream: bloc.accountOrPasswordStream,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, String>> snapshot) {
          if (ObjectUtil.isEmpty(snapshot.data)) {
            return getFlatButton(
                {Constant.LOGIN_ACCOUNT: "", Constant.PASSWORD: ""});
          }
          return getFlatButton(snapshot.data);
        },
      ),
    );
  }

  FlatButton getFlatButton(Map<String, String> data) {
    return new FlatButton(
      //  onPressed为空时，button会置灰
      onPressed: data[Constant.LOGIN_ACCOUNT].isEmpty ? null : () {
        if (data[Constant.PASSWORD].isNotEmpty) {
          login();
        } else {
          //  下一步
        }
      },
      color: ColorT.app_common,
      disabledColor: Colors.black12,
      disabledTextColor: Colors.black26,
      shape: new StadiumBorder(),
      child: new Center(
        child: data[Constant.LOGIN_ACCOUNT].isNotEmpty ? (data[Constant
            .PASSWORD].isNotEmpty
            ? new Text(
          "登录", style: TextStyles.buttonTextWhite,)
            :
        new Text("下一步", style: TextStyles.buttonTextWhite,)) : new Text(
          "登录", style: TextStyles.buttonTextWhite,),
      ),
    );
  }

  ///  忘记密码，跳转去忘记密码页面
  Container get buildForget {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: Dimens.ratio_width_3),
      child: new SizedBox(
        height: Dimens.ratio_height_4,
        child: new FlatButton(
          onPressed: () {
            NavigatorUtil.pushPage(context, new BlocProvider<LoginBloc>(
              child: ForgetPasswordVerifyPage(),
              bloc: new LoginBloc(),
            ));
          },
          child: new Text("忘记密码？", style: TextStyle(
              color: ColorT.app_common, fontSize: Dimens.font_space_15),),
        ),
      ),
    );
  }


  BuildContext mContext;  ///  拿到dialog的context，用于销毁
  Future login() async {
    showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          mContext = context;
          return new LoadingDialog(msg: "正在登录...",);
        }
    );
    bool loginToYun = await bloc.loginToYun(
        _userNameController.text, _userPassController.text);
    if(mContext != null){
      Navigator.pop(mContext);  // 销毁dialog对话框
      mContext = null;
    }

    if (loginToYun) {
      Global.needAuth = true;
      //  本地存储（已经登录）
      SpUtil.putBool(Constant.IS_LOGIN, true);

      //  跳转下一页面
//      NavigatorUtil.pushPage(context, new BlocProvider<LoginBloc>(
//          child: BindPhonePage(),
//          bloc: new LoginBloc(),
//      ));

    } else {
      //  提示账号密码错误
      ToastUtil.showToast("账号或密码错误");
    }
  }





}