import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 战绩播报页面
///
///
class AchievePage extends StatefulWidget {
  @override
  _AchieveState createState() => new _AchieveState();
}

class _AchieveState extends State<AchievePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('战绩播报'),
      ),
    );
  }
}