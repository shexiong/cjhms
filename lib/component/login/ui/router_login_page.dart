import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/component/login/entity/resp_login.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/sp_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tip_dialog/tip_dialog.dart';


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

  /// tip控制器
  TipDialogController tipController;

  ///  显示明文密码
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      if (bloc != null) {
        bloc.accountOrPasswordChange({
          Constant.LOGIN_ACCOUNT: _userNameController.text,
          Constant.LOGIN_PASSWORD: _userPassController.text
        });
      }
    });
    _userPassController.addListener(() {
      if (bloc != null) {
        bloc.accountOrPasswordChange({
          Constant.LOGIN_ACCOUNT: _userNameController.text,
          Constant.LOGIN_PASSWORD: _userPassController.text
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    tipController.dismiss();
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
          body: new TipDialogConnector(
            builder: (context, tipControll) {
              tipController = tipControll;

              return new Column(
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
              );
            },
          ),
        ),
        onWillPop: _requestPop,  ///  包一层WillPopScope用来点返回键退出
    );
  }

  ///  返回键退出
  Future<bool> _requestPop() {
    SystemNavigator.pop();
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
                  bloc.passwordVisiableChange(!showPassword);
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
                {Constant.LOGIN_ACCOUNT: "", Constant.LOGIN_PASSWORD: ""});
          }
          return getFlatButton(snapshot.data);
        },
      ),
    );
  }

  FlatButton getFlatButton(Map<String, String> data) {
    return new FlatButton(

      ///  onPressed为空时，button会置灰
      onPressed: data[Constant.LOGIN_ACCOUNT].isEmpty ? null : () {
        if (data[Constant.LOGIN_PASSWORD].isNotEmpty) {
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
            .LOGIN_PASSWORD].isNotEmpty
            ? new Text(
          "登录", style: TextStyles.buttonTextWhite,)
            :
        new Text("下一步", style: TextStyles.buttonTextWhite,)) : new Text(
          "登录", style: TextStyles.buttonTextWhite,),
      ),
    );
  }

  Container get buildForget {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: Dimens.ratio_width_3),
      child: new SizedBox(
        height: Dimens.ratio_height_4,
        child: new FlatButton(
          onPressed: () {},
          child: new Text("忘记密码？", style: TextStyle(
              color: ColorT.app_common, fontSize: Dimens.font_space_15),),
        ),
      ),
    );
  }


  Future login() async {
    tipController.show(
        tipDialog: new TipDialog(type: TipDialogType.LOADING, tip: "正在登录"),
        isAutoDismiss: false);
    LoginResponse loginToYun = await bloc.loginToYun(
        _userNameController.text, _userPassController.text);
    tipController.dismiss();
    if (loginToYun == null || loginToYun.token.isEmpty) {
      Fluttertoast.showToast(
          msg: "    账号或密码错误    ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color(0xAA111111),
          textColor: Color(0xFFFFFFFF)
      );
    } else {
      ///  本地存储数据
      SpUtil.putString(Constant.SP_USER_ACCOUNT, _userNameController.text);
      SpUtil.putString(Constant.SP_USER_PASSWORD, _userPassController.text);

      ///  跳转下一页面
    }
  }

}