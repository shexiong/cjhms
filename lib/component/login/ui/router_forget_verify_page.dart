import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/component/login/ui/router_forget_reset_page.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/navigator_util.dart';
import 'package:cjhms/utils/toast_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/dialog/loading_dialog.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/29
/// 描述： 忘记密码短信验证
///
class ForgetPasswordVerifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordVerifyState();
  }
}

class _ForgetPasswordVerifyState extends State<ForgetPasswordVerifyPage> {
  LoginBloc bloc;

  ///  编辑栏控制器
  TextEditingController _smsController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(() {
      if (bloc != null) {
        bloc.phoneAndSmsChange(
            {Constant.LOGIN_PHONE: _phoneController.text,
              Constant.LOGIN_SMS_MESSAGE: _smsController.text});
      }
    });
    _smsController.addListener(() {
      if (bloc != null) {
        bloc.phoneAndSmsChange(
            {Constant.LOGIN_PHONE: _phoneController.text,
              Constant.LOGIN_SMS_MESSAGE: _smsController.text});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///  拿到bloc
    bloc = BlocProvider.of<LoginBloc>(context);

    return new Scaffold(
      appBar: new CustomAppBar(
        child: new Stack(
          children: <Widget>[
            new Align(
                alignment: Alignment.centerLeft,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_4),
                  child: new IconButton(
                    iconSize: Dimens.space_width_24,
                    icon: new Icon(IconData(0xe672, fontFamily: Constant.IconFontFamily,),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            ),
            new Align(
                alignment: Alignment.center,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_4),
                  child: new Text("短信验证", style: TextStyles.pageTitle,),
                )
            ),
          ],
        )
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(margin: EdgeInsets.only(top: Dimens.ratio_width_18),),
          getPhoneOrSmsMessage("手机号"),
          buildInputPhone,
          getPhoneOrSmsMessage("验证码"),
          buildSmsMessage,
          buildVerify(),
        ],
      ),
    );
  }

  Container get buildInputPhone {
    return new Container(
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new TextField(
        style: new TextStyle(
            fontSize: Dimens.font_space_15, color: Colors.black),
        controller: _phoneController,
        maxLength: 20,
        decoration: new InputDecoration(
          hintText: "请输入手机号码",
          counterStyle: TextStyle(color: Colors.transparent),
          contentPadding: EdgeInsets.only(
              top: Dimens.space_width_10, bottom: Dimens.space_width_10),
        ),
      ),
    );
  }

  ///  验证码布局
  Padding get buildSmsMessage {
    Container smsContainer = new Container(
        child: new TextField(
          style: new TextStyle(
              fontSize: Dimens.font_space_15, color: Colors.black),
          controller: _smsController,
          maxLength: 20,
          decoration: new InputDecoration(
            hintText: "请输入验证码",
            counterStyle: TextStyle(color: Colors.transparent),
            contentPadding: EdgeInsets.only(
                top: Dimens.space_width_10, bottom: Dimens.space_width_10),
          ),
        )
    );
    Widget verifyCodeBtn = new Align(
      alignment: Alignment.bottomRight,
      child: new StreamBuilder(
        stream: bloc.bindPhoneVerifyCodeStream,
        builder: (BuildContext context,
            AsyncSnapshot<String> snapshot) {
          String verify = "获取验证码";
          bool canVerify = true;
          if (ObjectUtil.isNotEmpty(snapshot.data)) {
            canVerify = verify.compareTo(snapshot.data) == 0; /// 回到初始状态，可以点击去重新发送
            verify = snapshot.data;
          }
          return new InkWell(
            onTap: canVerify ? () {
              sendVerifyCode();
            } : null,
            child: new Container(
              width: Dimens.ratio_width_15,
              height: Dimens.ratio_width_4,
              child: new Center(
                child: new Text(
                  verify, style: new TextStyle(
                    color: canVerify ? ColorT.app_common : ColorT.gray_cc,
                    fontSize: Dimens.font_space_14),
                ),
              ),
            ),
          );
        },
      ),
    );
    return new Padding(
      padding: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new Stack(
        children: <Widget>[
          smsContainer,
          verifyCodeBtn,
        ],
      ),
    );
  }

  Future<bool> sendVerifyCode() async{
    if(_phoneController.text.isEmpty){
      ToastUtil.showToast("请先填写手机号码");
    }else if(Utils.isPhoneLegal(_phoneController.text)){
      bool result =  await bloc.sendForgetVerifyCode(_phoneController.text);
      return result;
    }else{
      ToastUtil.showToast("手机号码格式错误");
    }
    return false;
  }

  Container getPhoneOrSmsMessage(String textStr) {
    return new Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new Text(textStr, style: TextStyle(
          color: Colors.black, fontSize: Dimens.font_space_16),
      ),
    );
  }

  Container buildVerify() {
    return new Container(
      height: Dimens.ratio_width_10,
      margin: EdgeInsets.only(
          top: Dimens.ratio_height_5, left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new StreamBuilder(
        stream: bloc.phoneAndSmsSubject,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, String>> snapshot) {
          if (ObjectUtil.isEmpty(snapshot.data)) {
            return getFlatButton(
                {
                  Constant.LOGIN_PHONE: "",
                  Constant.LOGIN_SMS_MESSAGE: ""
                });
          }
          return getFlatButton(snapshot.data);
        },
      ),
    );
  }

  FlatButton getFlatButton(Map<String, String> data) {
    return new FlatButton(
      ///  onPressed为空时，button会置灰
      onPressed: (data[Constant.LOGIN_PHONE].isEmpty || data[Constant.LOGIN_SMS_MESSAGE].isEmpty)
          ? null : () {
        verifyPhoneAndCode();
      },
      color: ColorT.app_common,
      disabledColor: Colors.black12,
      disabledTextColor: Colors.black26,
      shape: new StadiumBorder(),
      child: new Center(
        child: new Text("下一步", style: TextStyles.buttonTextWhite,),
      ),
    );
  }

  BuildContext mContext;
  Future<bool> verifyPhoneAndCode() async{
    if(Utils.isPhoneLegal(_phoneController.text)){
      showDialog<Null>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            mContext = context;
            return new LoadingDialog(msg: "请稍候...",);
          }
      );
      bool isVerify = await bloc.verifyForgetVerifyCode(_phoneController.text, _smsController.text);
      if(mContext != null){
        Navigator.pop(mContext);  ///  销毁dialog对话框
        mContext = null;
      }
//      if(isVerify){
        ///  验证成功，去重置密码
        NavigatorUtil.pushPage(context, new BlocProvider<LoginBloc>(
          child: ForgetPasswordResetPage(),
          bloc: new LoginBloc(),
        ));
//      }else{
//        ToastUtil.showToast("验证码错误");
//      }
    }else{
      ToastUtil.showToast("手机号码格式错误");
    }
    return false;
  }



}
