import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 错题本首页
///
///
class ErrorPage extends StatefulWidget {
  @override
  _ErrorState createState() => new _ErrorState();
}

class _ErrorState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第三页'),
      ),
    );
  }
}