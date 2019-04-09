import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/adapter/adapter_achieve.dart';
import 'package:cjhms/component/achieve/bloc/bloc_achieve.dart';
import 'package:cjhms/component/achieve/entity/student_game_report.dart';
import 'package:cjhms/component/base/bloc_provider.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/refresh/refresh_scaffold.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

///
/// @author She xiong
/// 创建日期：2019/3/26
/// 描述： 战绩播报页面
///
///
class AchievePage extends StatefulWidget {
  @override
  _AchieveState createState() => new _AchieveState();
}

class _AchieveState extends State<AchievePage> {
  AchieveBloc bloc;
  RefreshController _controller = new RefreshController();

  ///  初始化获取数据
  void _initData() async {
    await bloc.getAchieveReportData();
  }

  @override
  Widget build(BuildContext context) {
    //  拿到bloc
    bloc = BlocProvider.of<AchieveBloc>(context);
    //  上下拉刷新控件状态监听改变
    bloc.homeStream.listen((status) {
      _controller.sendBack(true, status); //  设置下拉刷新关闭
    });
    new Future.delayed(new Duration(milliseconds: 500), _initData);

    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Utils.getImgPath('archieve_bg'),),
              fit: BoxFit.fill,
            )
        ),
        child: new Stack(
          children: <Widget>[
            buildAppBar(context),
            buildContainer,
          ],
        ),
      ),
    );
  }

  CustomAppBar buildAppBar(BuildContext context) {
    return new CustomAppBar(
        child: new Stack(
          children: <Widget>[
            new Align(
                alignment: Alignment.topLeft,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_4, left: Dimens.ratio_width_3),
                  child: new IconButton(
                    iconSize: Dimens.space_width_24,
                    icon: new Icon(
                      IconData(0xe68e, fontFamily: Constant.IconFontFamily,),
                      color: Colors.white,),
                    onPressed: () {},
                  ),
                )
            ),
            new Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_5),
                  child: new Text(
                    "战绩播报", style: TextStyle(fontSize: Dimens.font_space_20,
                      color: Colors.white),),
                )
            ),
          ],
        )
    );
  }

  Container get buildContainer {
    return new Container(
      margin: EdgeInsets.only(top: Dimens.ratio_width_16),
      child: new StreamBuilder(
          stream: bloc.studentReportStream,
          builder: (BuildContext context,
              AsyncSnapshot<List<StudentGameReport>> snapshot) {
            return new RefreshWrapper(
              controller: _controller,
              isLoading: snapshot.data == null,
              itemExtent: Dimens.ratio_height_8,
              onGetData: (up) {
                _initData();
              },
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) =>
              new AchieveReportItem(index, snapshot.data),
            );
          }
      ),
    );
  }


}