import 'package:cjhms/common/constant.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///  提示Toast
class ToastUtil {
  static OverlayEntry _overlayEntry; //toast靠它加到屏幕上
  static bool _showing = false; //toast是否正在showing
  static DateTime _startedTime; //开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static String _msg;
  static int _unicode;
  static Color _iconBgColor, _textColor;

  ///  常规toast
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: "     $message     ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xAA111111),
        textColor: Color(0xFFFFFFFF)
    );
  }


  ///  自定义带文字图片的toast
  static void toast(BuildContext context, String msg, int unicode,
      Color iconBgColor, Color textColor) async {
    assert(msg != null);
    _msg = msg;
    _unicode = unicode;
    _iconBgColor = iconBgColor;
    _textColor = textColor;
    _startedTime = DateTime.now();
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) =>
              Positioned(
                //top值，可以改变这个值来改变toast在屏幕中的位置
                top: MediaQuery.of(context).size.height / 7 * 3,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80.0),
                      child: AnimatedOpacity(
                        opacity: _showing ? 1.0 : 0.0, //目标透明度
                        duration: _showing
                            ? Duration(milliseconds: 100)
                            : Duration(milliseconds: 400),
                        child: _buildToastWidget(),
                      ),
                    )),
              ));
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }
    await Future.delayed(Duration(milliseconds: 2000)); //等待两秒
    //2秒后必须消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }

  ///  自定义toast绘制
  static _buildToastWidget() {
    return Center(
      child: Card(
        color: Colors.black38,
        shape: new RoundedRectangleBorder(side: BorderSide.none,
            borderRadius: BorderRadius.circular(Dimens.space_width_15)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: Dimens.ratio_width_6,
                height: Dimens.ratio_width_6,
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.ratio_width_3),
                  color: _iconBgColor,
                ),
                child: new Center(
                  child: IconButton(
                    padding: EdgeInsets.only(right: Dimens.ratio_width_1),
                    iconSize: Dimens.space_width_20,
                    icon: new Icon(IconData(
                      _unicode, fontFamily: Constant.IconFontFamily,),
                      size: Dimens.space_width_20,
                      color: Colors.white,),
                    onPressed: null,
                  ),
                ),
              ),
              Gaps.verticalGap15,
              Text(
                _msg, style: TextStyle(fontSize: 14.0, color: _textColor,),),
            ],
          ),
        ),
      ),
    );
  }
}