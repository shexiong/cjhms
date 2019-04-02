import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/component/login/bloc/bloc_login.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/toast_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/dialog/loading_dialog.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/29
/// 描述： 重置密码
///
class ForgetPasswordResetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordResetState();
  }
}

class _ForgetPasswordResetState extends State<ForgetPasswordResetPage> {
  LoginBloc bloc;

  ///  编辑栏控制器
  TextEditingController _newPasswordCheckController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(() {
      if (bloc != null) {
        bloc.phoneAndSmsChange(
            {Constant.RESET_NEW_PASSWORD: _newPasswordController.text,
              Constant.RESET_CHECK_NEW_PASSWORD: _newPasswordCheckController.text});
      }
    });
    _newPasswordCheckController.addListener(() {
      if (bloc != null) {
        bloc.phoneAndSmsChange(
            {Constant.RESET_NEW_PASSWORD: _newPasswordController.text,
              Constant.RESET_CHECK_NEW_PASSWORD: _newPasswordCheckController.text});
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
                  child: new Text("重置密码", style: TextStyles.pageTitle,),
                )
            ),
          ],
        )
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(margin: EdgeInsets.only(top: Dimens.ratio_width_18),),
          buildInputNewPasswordTitle("新密码"),
          buildInputNewPassword,
          buildInputNewPasswordTitle("确认新密码"),
          buildCheckNewPassword,
          buildReset(),
        ],
      ),
    );
  }

  Container get buildInputNewPassword {
    return new Container(
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new TextField(
        style: new TextStyle(
            fontSize: Dimens.font_space_15, color: Colors.black),
        controller: _newPasswordController,
        maxLength: 20,
        decoration: new InputDecoration(
          hintText: "请输入新密码",
          counterStyle: TextStyle(color: Colors.transparent),
          contentPadding: EdgeInsets.only(
              top: Dimens.space_width_10, bottom: Dimens.space_width_10),
        ),
      ),
    );
  }

  Container get buildCheckNewPassword {
     return new Container(
         margin: EdgeInsets.only(left: Dimens.ratio_width_9,
             right: Dimens.ratio_width_9),
        child: new TextField(
          style: new TextStyle(
              fontSize: Dimens.font_space_15, color: Colors.black),
          controller: _newPasswordCheckController,
          maxLength: 20,
          decoration: new InputDecoration(
            hintText: "请再次输入新密码确认",
            counterStyle: TextStyle(color: Colors.transparent),
            contentPadding: EdgeInsets.only(
                top: Dimens.space_width_10, bottom: Dimens.space_width_10),
          ),
        )
    );
  }

  Container buildInputNewPasswordTitle(String textStr) {
    return new Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: Dimens.ratio_width_9,
          right: Dimens.ratio_width_9),
      child: new Text(textStr, style: TextStyle(
          color: Colors.black, fontSize: Dimens.font_space_16),
      ),
    );
  }

  Container buildReset() {
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
                  Constant.RESET_NEW_PASSWORD: "",
                  Constant.RESET_CHECK_NEW_PASSWORD: ""
                });
          }
          return getFlatButton(snapshot.data);
        },
      ),
    );
  }

  FlatButton getFlatButton(Map<String, String> data) {
    return new FlatButton(
      //  onPressed为空时，button会置灰
      onPressed: (data[Constant.RESET_NEW_PASSWORD].isEmpty || data[Constant.RESET_CHECK_NEW_PASSWORD].isEmpty)
          ? null : () {
        resetPassword();
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

  BuildContext mContext;
  Future<bool> resetPassword() async{
    if(_newPasswordController.text.compareTo(_newPasswordCheckController.text) == 0){
      showDialog<Null>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            mContext = context;
            return new LoadingDialog(msg: "请稍候...",);
          }
      );
      bool reset = await bloc.resetPassword(_newPasswordController.text);
      if(mContext != null){
        Navigator.pop(mContext);  //  销毁dialog对话框
        mContext = null;
      }
//      if(reset){
        //  重置密码成功
        ToastUtil.toast(context, "修改成功", 0xe6ba, ColorT.app_common, Colors.white);
//      }else{
//        ToastUtil.showToast("重置密码失败");
//      }
    }else{
      ToastUtil.showToast("两次输入的密码不一致");
    }
    return false;
  }



}
