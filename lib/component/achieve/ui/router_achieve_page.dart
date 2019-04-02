import 'package:cjhms/common/constant.dart';
import 'package:cjhms/component/achieve/adapter/adapter_achieve.dart';
import 'package:cjhms/resources/res_index.dart';
import 'package:cjhms/utils/screen_util.dart';
import 'package:cjhms/utils/utils.dart';
import 'package:cjhms/widget/widget_app_bar.dart';
import 'package:common_utils/common_utils.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Utils.getImgPath('archieve_bg'),),
              fit: BoxFit.fill,
            )
        ),
        child: buildStack(context),
      ),
    );
  }

  Stack buildStack(BuildContext context) {
    return new Stack(
      children: <Widget>[
        buildAppBar(context),
        new Container(
          margin: EdgeInsets.only(top: Dimens.ratio_width_16),
          child: new StreamBuilder(
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (ObjectUtil.isEmpty(snapshot.data)) {
                }
                return new SmartRefresher(
                  child: new ListView.builder(
                    reverse: true,
                    itemExtent: Dimens.ratio_height_8,
                    itemCount: 24,
                    itemBuilder: (context, index) => new AchieveItem(),
                  ),
                );
              }
          ),
        ),
      ],
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
                      IconData(0xe68e, fontFamily: Constant.IconFontFamily,),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            ),
            new Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  margin: EdgeInsets.only(
                      top: Dimens.ratio_height_5),
                  child: new Text("战绩播报", style: TextStyles.pageTitle,),
                )
            ),
          ],
        )
    );
  }
}