import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/28
/// 描述： 绑定手机页面
///
class BindPhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BindPhoneState();
  }
}

class _BindPhoneState extends State<BindPhonePage> {
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
        child: new Align(
            alignment: Alignment.center,
            child: new Container(
              margin: EdgeInsets.only(
                  top: Dimens.ratio_height_4),
              child: new Text("绑定手机", style: TextStyles.pageTitle,),
            )
        ),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(margin: EdgeInsets.only(top: Dimens.ratio_width_18),),
          getPhoneOrSmsMessage("手机号"),
          buildBindPhone,
          getPhoneOrSmsMessage("验证码"),
          buildSmsMessage,
          buildBind(),
          buildNextStep
        ],
      ),
    );
  }

  Container get buildBindPhone {
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
              bloc.bindPhoneVerifyCode();
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

  Container buildBind() {
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

      },
      color: ColorT.app_common,
      disabledColor: Colors.black12,
      disabledTextColor: Colors.black26,
      shape: new StadiumBorder(),
      child: new Center(
        child: new Text("确定", style: TextStyles.buttonTextWhite,),
      ),
    );
  }

  Container get buildNextStep {
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: Dimens.ratio_width_3),
      child: new SizedBox(
        height: Dimens.ratio_height_4,
        child: new FlatButton(
          onPressed: () {},
          child: new Text("跳过", style: TextStyle(
              color: ColorT.app_common, fontSize: Dimens.font_space_15),),
        ),
      ),
    );
  }
}
