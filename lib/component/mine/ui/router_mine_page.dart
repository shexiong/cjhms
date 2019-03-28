import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： ‘我的’首页
///
///
class MinePage extends StatefulWidget {
  @override
  _MineState createState() => new _MineState();
}

class _MineState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第四页'),
      ),
    );
  }
}