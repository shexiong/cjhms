import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 任务记录首页
///
///
class MissionPage extends StatefulWidget {

  final PageStorageKey<String> pageKey; //当前控件唯一标识Key

  MissionPage({@required this.pageKey}) : assert(pageKey != null);

  @override
  _MissionState createState() => new _MissionState();
}

class _MissionState extends State<MissionPage> with SingleTickerProviderStateMixin{
  Animation<double> moveOutAni;
  Animation<double> radiusOutAni;
  AnimationController _outController;
  ///  任务弹窗是否已弹出
  bool missionButtonIsOut = false;
  ///  未弹出时默认隐藏弹出栏右边部分
  bool hiddenRightWidget = true;

  @override
  void initState() {
    super.initState();
    _outController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 300));
    _initAni();
  }

  @override
  void dispose() {
    super.dispose();
    _outController?.dispose();
  }

  void _initAni() {
    moveOutAni = Tween(begin: Dimens.ratio_width_80, end: Dimens.ratio_width_10)
        .animate(
        new CurvedAnimation(parent: _outController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          hiddenRightWidget = false;
          missionButtonIsOut = !missionButtonIsOut;
        } else if (status == AnimationStatus.dismissed) {
          missionButtonIsOut = !missionButtonIsOut;
        } else {
          hiddenRightWidget = true;
        }
      });
    radiusOutAni = Tween(begin: 0.0, end: Dimens.ratio_width_12)
        .animate(
        new CurvedAnimation(parent: _outController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('第一页'),
      ),
    );
  }
}