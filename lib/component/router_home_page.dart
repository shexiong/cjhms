import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/error/ui/router_error_page.dart';
import 'package:cjhms/component/mine/ui/router_mine_page.dart';
import 'package:cjhms/component/mission/ui/router_mission_page.dart';
import 'package:cjhms/component/record/ui/router_record_page.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/widget/bottombar/bottom_tab_bar.dart';
import 'package:flutter/material.dart';

///
/// @author She xiong
/// 创建日期：2019/3/20
/// 描述： 导航栏首页
///
///
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [];
  int _selectedIndex = 0;
  List<Widget> widgetList = List();

  var icons = [
    IconData(0xe66f, fontFamily: Constant.IconFontFamily,),
    IconData(0xe677, fontFamily: Constant.IconFontFamily,),
    IconData(0xe676, fontFamily: Constant.IconFontFamily,),
    IconData(0xe671, fontFamily: Constant.IconFontFamily,),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    titles = <String>['作业任务', '做题记录', '错题本', '我的'];
    widgetList..add(MissionPage())..add(RecordPage())..add(ErrorPage())..add(MinePage());
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: Colors.grey,
        body: widgetList[_selectedIndex],
        bottomNavigationBar: BottomTabBar(
          items: <BottomTabBarItem>[
            BottomTabBarItem(icon: Icon(icons[0]), title: Text(titles[0])),
            BottomTabBarItem(icon: Icon(icons[1]), title: Text(titles[1])),
            BottomTabBarItem(icon: Icon(icons[2]), title: Text(titles[2])),
            BottomTabBarItem(icon: Icon(icons[3]), title: Text(titles[3])),
          ],
          fixedColor: ColorT.app_common,
          iconSize: Dimens.ratio_width_4,
          currentIndex: _selectedIndex,
          onTap: _onItemSelected,
          type: BottomTabBarType.fixed,
          isAnimation: false,
          isInkResponse: false,
          badgeColor: Colors.red,
        ),
      ),
    );
  }
}