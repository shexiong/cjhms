import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 任务记录首页
///
///
class MissionPage extends StatefulWidget {
  @override
  _MissionState createState() => new _MissionState();
}

class _MissionState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一页'),
      ),
    );
  }
}