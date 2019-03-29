import 'package:flutter/material.dart';

///  加载对话框
// ignore: must_be_immutable
class LoadingDialog extends Dialog {

  //加载提示内容
  final String msg;

  //加载中动画
  final Widget progress;

  //字体颜色
  final Color textColor;

  LoadingDialog(
      {Key key, this.msg, this.progress = const CircularProgressIndicator(),
        this.textColor = Colors.white})
      : super(key: key);

  @override Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.black87, borderRadius: BorderRadius.circular(15.0)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              progress,
              Container(padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                child: Text(
                  msg, style: TextStyle(color: textColor, fontSize: 16.0),),)
            ],
          ),
        ),
      ),
    );
  }
}