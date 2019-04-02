import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

class Utils {


  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }


  ///大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
  /// 此方法中前三位格式有：
  /// 13+任意数 * 15+任意数 * 18+除1和4的任意数 * 17+除9的任意数 * 147
  static bool isPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }



}
