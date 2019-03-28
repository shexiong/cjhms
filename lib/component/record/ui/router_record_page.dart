import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 做题记录首页
///
///
class RecordPage extends StatefulWidget {
  @override
  _RecordState createState() => new _RecordState();
}

class _RecordState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第二页'),
      ),
    );
  }
}